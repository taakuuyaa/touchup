class VideosController < ApplicationController
  before_action :require_login_in!

  def index
    @video = Video.all
  end

  def new
    @video = Video.new
  end

  def create

    @video = Video.save_from_request(video_params)

    if @video.persisted?
      flash[:success] = "動画を投稿しました。"
      redirect_to :controller => 'videos', :action => "index"
    else
      flash.now[:danger] = "動画の投稿に失敗しました。"
      render :new
    end
  end

  def destroy
    redirect_to :controller => 'videos', :action => "index"
  end

  private

  def video_params
    params.permit(:item_url, :file, :text)
  end
end
