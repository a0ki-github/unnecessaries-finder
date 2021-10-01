module UploadsHelper
  def twitter_share_url(detected_items)
    link = request.protocol + request.host + "%0a"
    sentence = "これらは手放すべき？%0aご意見・コメントお待ちしてます%0a"
    items = detected_items.map {|detected_item| "・" + detected_item + "%0a"}.join + "%0a"
    hashtags = "いらないモノ診断,ミニマリスト"

    return "https://twitter.com/share?text=#{sentence + items}&url=#{link}&hashtags=#{hashtags}"
  end
end
