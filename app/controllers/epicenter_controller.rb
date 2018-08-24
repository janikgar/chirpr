class EpicenterController < ApplicationController

  before_action :authenticate_user!

  def feed
  	@following_chirps = []

  	Chirp.all.each do |chirp|
  		if current_user.following.include?(chirp.user_id) || current_user.id == chirp.user_id
  			@following_chirps.push(chirp)
  		end
  	end
  end

  def whats_trending
    @top_hashtags = Tag.all.joins(:chirp_tags)
      .group(:phrase)
      .order("COUNT(phrase) desc")
      .limit(3)
      .pluck(:phrase, "COUNT(phrase)")
      @top_chirpr = User.first
    @top_chirpr = User.find(
      Chirp.all.joins(:user)
      .group(:username)
      .order("COUNT(username) desc")
      .limit(1).pluck(:user_id)[0]
    )
  end

  def following
    @user = User.find_by(username: params[:username])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find_by(username: params[:username])
    @users = []
    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end
  end

  def all_users
    @users = User.all.order(:username)
  end

  def show_user
  	@user = User.find_by(username: params[:username])
  end

  def now_following
    @user = User.find(params[:id])
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(username: @user.username)
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(username: params[:username])
  end

  def chirp_tags
    @tag = Tag.find_by(phrase: '#' + params[:phrase])
  end
end
