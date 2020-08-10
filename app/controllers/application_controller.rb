class ApplicationController < ActionController::Base

  #  def authenticate_admin_user!
   #     puts session[:user].inspect
   #     redirect_to login_path unless session[:user] && session[:user]["employee"] == true
   #   end
   # 
   #   def current_admin_user
   #     session[:user]
   #   end

  # before_action :authenticate_user!
  def authenticate_admin!
    # puts "----------------------------------------------------------------------------"
    # puts current_user.admin
   redirect_to new_user_session_path unless current_user.admin
  end
  #  helper_method :current_user, :signed_in?, :is_admin?

  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end

  #def signed_in?
  #  !!current_user
 # end

 #def is_admin?
  #  signed_in? ? current_user.admin : false
 # end
#
#


end
