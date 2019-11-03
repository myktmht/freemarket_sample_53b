class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user!
  
#   def mypage
#   end
 
#   protected
 
  def after_sign_up_path_for(resource)
     guide_beginner_path
  end
end