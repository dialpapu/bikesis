class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  		u.permit(:personId, :document, :personName,:lastName,:telephone, :personStatus,:email, :password, :password_confirmation)
  	end


  	def show
  		@user = User.find(params[:id])
  	end
  end
end
