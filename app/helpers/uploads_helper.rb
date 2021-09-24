module UploadsHelper
  def twitter_share_url(detected_items)
    link = request.url
    sentence = "次のモノを手放すべきか、ご意見・コメントお待ちしてます%0a"
    items = detected_items.map {|detected_item| "・" + detected_item + "%0a"}.join

    return "https://twitter.com/share?text=#{sentence + items}&url=#{link}"
  end
end
