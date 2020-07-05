class VideosController < ApplicationController
  before_action :require_login_in!

  def index
    @video = Video.all.page(params[:page]).per(10)
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
    @video = Video.find(params[:id])

    @video.destroy
    redirect_to :controller => 'videos', :action => "index"
  end

  def change_status
    @video = Video.find(params[:id])

    case @video.status
    when 'published'
      @video.closed!
    when 'closed'
      @video.published!
    else
      nil
    end
  end

  private

  def video_params
    params.permit(:item_url, :file, :text)
  end
end
