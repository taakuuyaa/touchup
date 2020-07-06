class SessionsController < ApplicationController
  before_action :set_tenant, only: [:create]

  def new
  end

  def create
    if @tenant.authenticate(session_params[:password])
      login_in @tenant
      redirect_to :controller => 'videos', :action => "index"
    else
      flash.now[:error] = t('sessions.errors.login_error')
      render 'new'
    end
  end

  def destroy
    log_out if login_in?
    redirect_to login_path
  end

  private

  def set_tenant
    @tenant = Tenant.find_by!(email: session_params[:email].downcase)
  rescue
    flash.now[:error] = t('sessions.errors.login_error')
    render action: 'new'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
