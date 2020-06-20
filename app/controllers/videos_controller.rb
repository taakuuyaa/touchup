class VideosController < ApplicationController
  before_action :require_login_in!

  def index
    @message = "動画一覧ページ"
  end

  def new
    @message = "動画作成ページ"
  end

  def create
  end
end
