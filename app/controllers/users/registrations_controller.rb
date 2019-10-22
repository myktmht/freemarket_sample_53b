class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  # mypageはルーティングのテストのために試作（locallhost:3000/mypage）。以下と関連付いています。
  # routes.rb  get 'mypage' => 'users/registrations#mypage'
  # devise>registrations>mypage.html.haml
  def mypage
  end
 
  protected
 
  def after_sign_up_path_for(resource)
     my_page_path
  end
end