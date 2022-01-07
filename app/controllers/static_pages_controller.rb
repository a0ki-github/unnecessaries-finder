class StaticPagesController < ApplicationController
  def terms_of_use
    set_meta_tags title: '利用規約'
  end

  def privacy_policy
    set_meta_tags title: 'プライバシーポリシー'
  end

  def contact
    set_meta_tags title: 'お問い合わせ'
  end
end
