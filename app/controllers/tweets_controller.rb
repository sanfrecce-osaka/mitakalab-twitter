class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    Tweet.create(tweet_params)
    redirect_to tweets_path
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end
end
