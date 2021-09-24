class StaticPagesController < ApplicationController
  def terms_of_use
    set_meta_tags title: '利用規約'
  end
end
