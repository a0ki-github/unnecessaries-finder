class Admin::BaseController < ApplicationController
  include Admin::SessionsHelper

  private

  def require_admin_login
    unless login_for_admin?
      redirect_to admin_login_path, success: '管理者としてログインしてください'
    end
  end
end
