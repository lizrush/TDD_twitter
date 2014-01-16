class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path(@tweet)
    else
      render :index
    end
  end

  def show
  end

  def index
    @tweet = Tweet.new
    @tweets = Tweet.order('created_at DESC')
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:user, :body)
  end
end
