class SessionsController < ApplicationController

  def new
  end

  def create
    tenant = Tenant.find_by(email: params[:session][:email].downcase)
    # binding.pry
    if tenant && tenant.authenticate(params[:session][:password])
      login_in tenant
      redirect_to subdomain: tenant.subdomain, :controller => 'video', :action => "index"
    else
      # エラーメッセージを表示し、サインインフォームを再描画する。
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
