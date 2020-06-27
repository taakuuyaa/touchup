module SessionsHelper

  def login_in(tenant)
    remember_token = Tenant.new_remember_token
    # TODO 有効期限設定
    cookies.permanent[:remember_token] = remember_token
    tenant.update_attribute(:remember_token, Tenant.encrypt(remember_token))
    self.current_tenant = tenant
  end

  def log_out
    cookies.delete(:remember_token)
    @current_tenant = nil
  end

  def current_tenant=(tenant)
    @current_tenant = tenant
  end

  def current_tenant
    remember_token = Tenant.encrypt(cookies[:remember_token])
    @current_tenant ||= Tenant.find_by(remember_token: remember_token)
  end

  def login_in?
    current_tenant.present?
  end

  def destroy
    self.current_tenant = nil
    cookies.delete(:remember_token)
  end

  def require_login_in!
    redirect_to :controller => 'sessions', :action => "new" unless login_in?
  end

end
