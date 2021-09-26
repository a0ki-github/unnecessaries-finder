class FeedbacksController < ApplicationController
  before_action :set_title

  def new
    @feedback = Feedback.new
  end

  def show
  end

  private

  def set_title
    set_meta_tags title: 'お問い合わせ'
  end
end
