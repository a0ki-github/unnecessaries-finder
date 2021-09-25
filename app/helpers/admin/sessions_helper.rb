module Admin::SessionsHelper
  def admin_authenticate(password)
    digest(password) == Rails.application.credentials.admin[:password_digest]
  end

  def digest(string)
    Digest::MD5.hexdigest(string)
  end
end
