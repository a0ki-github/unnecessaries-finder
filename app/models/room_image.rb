require 'net/http'

class RoomImage
  include ActiveModel::Model
  attr_accessor :base64_encoded, :detected_items

  def save
    detect && translate
  end

  private

  def detect
    api_key = Rails.application.credentials.gcp[:vision_api][:api_key]
    api_url = URI("https://vision.googleapis.com/v1/images:annotate?key=#{api_key}")
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
            content: base64_encoded
          }
        }
      ]
    }.to_json

    response = Net::HTTP.post(api_url, body, headers)

    if response.code == '200'
      @detected_items = JSON.parse(response.body)['responses'][0]["localizedObjectAnnotations"]&.map {|i| i['name']}&.uniq
      return true
    end

    false
  end

  def translate
    return true if @detected_items.nil?

    api_key = Rails.application.credentials.gcp[:translation_api][:api_key]
    api_url = URI("https://translation.googleapis.com/language/translate/v2?key=#{api_key}")
    headers = { "Content-Type" => "application/json" }
    body = { q: @detected_items, source: "en", target: "ja" }.to_json

    response = Net::HTTP.post(api_url, body, headers)

    if response.code == '200'
      @detected_items = JSON.parse(response.body)['data']['translations']&.map {|i| i['translatedText']}
      return true
    end

    false
  end
end
