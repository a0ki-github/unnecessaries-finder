class UploadsController < ApplicationController
  after_action :register_items, only: :create

  def new
  end

  def create
    @room_image = RoomImage.new(base64_encoded: Base64.strict_encode64(params[:room_image].read))
    if @room_image.save
      @items = Item.filled.detected(@room_image.detected_items)
    end
  end

  private

  def register_items
    @room_image.detected_items.each {|item| Item.find_or_create_by(name: item) }
  end
end
