module SessionsHelper

  def login_in(tenant)
    remember_token = Tenant.new_remember_token
    cookies.permanent[:remember_token] = {
        value: remember_token,
        domain: :all,
        tld_length: 2
    }
    tenant.update_attribute(:remember_token, Tenant.encrypt(remember_token))
    self.current_tenant = tenant
  end

  def current_tenant=(tenant)
    @current_tenant = tenant
  end

  # signed_in?を経由して、セッションが張られているかどうかを確認する
  # つまり、（ほとんどの）リクエストの度に呼ぶようにする。
  def current_tenant
    remember_token = Tenant.encrypt(cookies[:remember_token])
    @current_tenant ||= Tenant.find_by(remember_token: remember_token)
  end

  def login_in?
    !current_tenant.nil? && request.subdomain == current_tenant.subdomain
  end

  def destroy
    self.current_tenant = nil
    cookies.delete(:remember_token)
  end

  def require_login_in!
    redirect_to subdomain: 'app', :controller => 'sessions', :action => "new" unless login_in?
  end

end
