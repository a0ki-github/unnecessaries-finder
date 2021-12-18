class UploadsController < ApplicationController
  def new
  end

  def create
    @room_image = RoomImage.new(base64_encoded: Base64.strict_encode64(params[:room_image].read))

    if @room_image.save
      puts 'hello'
    else
      flash.now[:danger] = '予期せぬエラーが発生しております。申し訳ありませんがアップデートをお待ちください。'
    end

    # 検出したモノを登録有無によって仕分け
    @room_image.regd_items = []
    @room_image.unregd_items = []

    @room_image.detected_items&.each do |detected_item|
      if Item.find_by(name: detected_item)&.why_release.present?
        @room_image.regd_items << detected_item
      else
        @room_image.unregd_items << detected_item
        Item.create(name: detected_item) unless Item.exists?(name: detected_item)
      end
    end
  end
end
