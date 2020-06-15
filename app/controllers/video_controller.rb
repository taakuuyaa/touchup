class VideoController < ApplicationController
  before_action :require_login_in!

  def index
    # binding.pry
    @message = "static page"
  end
end
