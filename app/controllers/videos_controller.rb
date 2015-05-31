class VideosController < ApplicationController
  before_action :require_user
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @reviews = @video.reviews
  end

  def search
    @videos = Video.search_by_title(params[:title])
  end
end