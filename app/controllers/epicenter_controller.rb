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

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find(params[:id])
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
