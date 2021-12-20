class UploadsController < ApplicationController
  after_action :add_items, only: :create

  def new
  end

  def create
    @room_image = RoomImage.new(base64_encoded: base64_encoded)
    if @room_image.save
      @items = Item.filled.detected(@room_image.detected_items)
    else
      redirect_to root_path
      flash[:danger] = '予期せぬエラーが発生しました。開発者にお問い合わせください。'
    end
  end

  private

  def base64_encoded
    Base64.strict_encode64(params[:room_image].read)
  end

  def add_items
    @room_image.detected_items&.each {|item| Item.find_or_create_by(name: item) }
  end
end
