require 'net/http'

class UploadsController < ApplicationController
  include UploadsHelper

  def new
  end

  def create
    room_image = Base64.strict_encode64(params[:room_image].read)

    # アップロードされた画像を解析
    @detected_items = detect_items(room_image)

    # 検出したモノを登録有無によって仕分け
    @judged_items = []; @unregd_items = []
    @detected_items&.each do |detected_item|
      if Item.find_by(name: detected_item)&.why_release.present?
        @judged_items << detected_item
      else
        @unregd_items << detected_item
        Item.create(name: detected_item) unless Item.exists?(name: detected_item)
      end
    end
  end
end
