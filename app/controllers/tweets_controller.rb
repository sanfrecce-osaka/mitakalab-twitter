class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
  end

  def create
    @tweet = Tweet.create(params[:tweet])
    redirect_to tweets_path
  end
end
