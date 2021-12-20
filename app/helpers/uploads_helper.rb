module UploadsHelper
  def twitter_share_url(items)
    link = request.protocol + request.host + "%0a"
    sentence = "これらは「実はいらない」かもしれません。%0a"
    items = items.pluck(:name).map {|item| "・" + item + "%0a"}.join + "%0a"
    hashtags = "いらないモノ診断,ミニマリスト"

    return "https://twitter.com/share?text=#{sentence + items}&url=#{link}&hashtags=#{hashtags}"
  end
end
