class VideosController < ApplicationController
  before_action :require_login_in!

  def index
    @video = Video.all.page(params[:page]).per(10)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.video_capacity = VideoCapacity.new(capacity: @video.file.size)

    if @video.save
      # todo videw側表示
      flash[:success] = "動画を投稿しました。"
      redirect_to :controller => 'videos', :action => "index"
    else
      # todo videw側表示
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
    params.require(:video).permit(:item_url, :file, :file_cache, :text, video_item_links_attributes: [:name, :url, :_destroy])
  end
end
