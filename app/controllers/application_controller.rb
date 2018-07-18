class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception # protects from CSRF attacks

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :name, :bio, :location, :avatar, :following])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :name, :bio, :location, :avatar, :following])
		devise_parameter_sanitizer.permit(:sign_in) do |user_params|
			user_params.permit(:username, :email)
		end
	end
end
