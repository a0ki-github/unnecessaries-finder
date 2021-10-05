require 'net/http'

class UploadsController < ApplicationController
  include UploadsHelper
  before_action :require_image, only: :create

  def new
  end

  def create
    room_image = Base64.strict_encode64(params[:room_image].read)

    @detected_items = detect_items(room_image)

    @judged_items = []
    @unregd_items = []
    @detected_items&.each do |detected_item|
      if Item.find_by(name: detected_item)&.why_release.present?
        @judged_items << detected_item
      else
        @unregd_items << detected_item
        Item.create(name: detected_item) unless Item.exists?(name: detected_item)
      end
    end
  end

  private

  def require_image
    if params[:room_image].nil?
      flash.now[:danger] = '画像を登録してください'
      render :new
    end
  end
end
