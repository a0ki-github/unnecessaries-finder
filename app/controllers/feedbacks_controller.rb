class FeedbacksController < ApplicationController
  before_action :set_title

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to feedbacks_path, success: '問い合わせが送信されました'
    else
      flash.now[:danger] = '問い合わせが送信できませんでした'
      render :new
    end
  end

  def show
  end

  private

  def feedback_params
    params.require(:feedback).permit(:kind, :content)
  end

  def set_title
    set_meta_tags title: 'お問い合わせ'
  end
end
