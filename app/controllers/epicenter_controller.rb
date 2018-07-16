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

  def show_user
  	@user = User.find_by(username: params[:username])
  end

  def now_following
  	current_user.following.push(params[:username].to_i)
  	current_user.save

  	redirect_to show_user_path(username: params[:username])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(username: params[:username])
  end
end
