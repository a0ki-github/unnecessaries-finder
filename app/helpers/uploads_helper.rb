module UploadsHelper
  def twitter_share_url
    link = request.protocol + request.host + "%0a"
    sentence = "このアプリで「実はいらないモノ」が見つかりました。%0a"
    hashtags = "いらないモノ診断,ミニマリスト"

    return "https://twitter.com/share?text=#{sentence}&url=#{link}&hashtags=#{hashtags}"
  end
end
