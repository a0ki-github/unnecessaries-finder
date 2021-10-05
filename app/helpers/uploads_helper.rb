module UploadsHelper
  def detect_items(room_image)
    vision_api_key = Rails.application.credentials.gcp[:vision_api][:api_key]
    vision_api_url = URI("https://vision.googleapis.com/v1/images:annotate?key=#{vision_api_key}")
    headers = { "Content-Type" => "application/json" }
  
    body = {
      requests: [
        {
          features: [
            {
              maxResults: 10,
              type: "OBJECT_LOCALIZATION"
            }
          ],
          image: {
            content: room_image
          }
        }
      ]
    }.to_json
  
    response_from_vision_api = Net::HTTP.post(vision_api_url, body, headers)
  
    if response_from_vision_api.code == '200'
      detected_items = JSON.parse(response_from_vision_api.body)['responses'][0]["localizedObjectAnnotations"]&.map {|i| i['name']}&.uniq
      detected_items.present? ? translate_into_ja(detected_items) : nil
    else
      flash.now[:danger] = '申し訳ございません。エラーが発生しておりますのでアップデートをお待ちください。'
      render :new
    end
  end
  
  def translate_into_ja(detected_items)
    translation_api_key = Rails.application.credentials.gcp[:translation_api][:api_key]
    translation_api_url = URI("https://translation.googleapis.com/language/translate/v2?key=#{translation_api_key}")
    headers = { "Content-Type" => "application/json" }
    body = { q: detected_items, source: "en", target: "ja" }.to_json
  
    response_from_transition_api = Net::HTTP.post(translation_api_url, body, headers)
    JSON.parse(response_from_transition_api.body)['data']['translations']&.map {|i| i['translatedText']}
  end

  def twitter_share_url(detected_items)
    link = request.protocol + request.host + "%0a"
    sentence = "これらは手放すべき？%0aご意見・コメントお待ちしてます%0a"
    items = detected_items.map {|detected_item| "・" + detected_item + "%0a"}.join + "%0a"
    hashtags = "いらないモノ診断,ミニマリスト"

    return "https://twitter.com/share?text=#{sentence + items}&url=#{link}&hashtags=#{hashtags}"
  end
end
