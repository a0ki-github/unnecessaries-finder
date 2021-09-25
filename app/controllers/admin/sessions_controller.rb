class Admin::SessionsController < Admin::BaseController

  def new
  end

  def create
    password = params[:session][:admin_password]
    if admin_authenticate(password)
      session[:admin_password] = digest(password)
      redirect_to admin_items_path, success: '管理者としてログインしました'
    else
      flash.now[:danger] = 'パスワードが間違っています'
      render :new
    end
  end
end
