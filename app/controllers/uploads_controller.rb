require 'net/http'

class UploadsController < ApplicationController
  before_action :require_image, only: :create

  def new
  end

  def create
    base64_image = Base64.strict_encode64(params[:room_image].read)
    api_key = Rails.application.credentials.gcp[:vision_api][:api_key]
    headers = { "Content-Type" => "application/json" }

    body = { 
      requests: [
        {
          features: [
            {
              maxResults: 10,
              type: "OBJECT_LOCALIZATION"
            }
          ],
          image: {
            content: base64_image
          }
        }
      ]
    }.to_json

    response = Net::HTTP.post(
      URI("https://vision.googleapis.com/v1/images:annotate?key=#{api_key}"),
      body,
      headers
    )

    debugger

    if response.code == '200'
      redirect_to '/uploads/show'
    else
      flash.now[:alert] = 'APIリクエストが失敗しています'
      render :new
    end

  end

  def show
  end

  private

  def require_image
    if params[:room_image].nil?
      flash[:notice] = '画像を登録してください'
      render :new
    end
  end
end
