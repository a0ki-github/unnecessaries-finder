class UploadsController < ApplicationController
  def new
  end

  def create
    @room_image = RoomImage.new(base64_encoded: Base64.strict_encode64(params[:room_image].read))
    @room_image.save
  end
end
