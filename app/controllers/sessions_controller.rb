class SessionsController < ApplicationController

  def new
  end

  def create
    tenant = Tenant.find_by(email: params[:session][:email].downcase)
    if tenant && tenant.authenticate(params[:session][:password])
      sign_in tenant
      # redirect_to
    else
      # エラーメッセージを表示し、サインインフォームを再描画する。
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
