class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new
    @profile = Profile.new
  end

  def first_validation
    # 入力値を全てsessionに保存
    #session[:nickname] = user_params[:nickname]
    #session[:email] = user_params[:email]
    #session[:password] = user_params[:password]
    #session[:password_confirmation] = user_params[:password_confirmation]
    #session[:birth_year] = profile_params[:birth_year]
    #session[:birth_month] = profile_params[:birth_month]
    #session[:birth_day] = profile_params[:birth_day]
    #session[:last_name] = profile_params[:last_name]
    #session[:first_name] = profile_params[:first_name]
    #session[:last_name_kana] = profile_params[:last_name_kana]
    #session[:first_name_kana] = profile_params[:first_name_kana]
    # バリデーション判定用にuserをnewする
    #@user = User.new(
      #nickname: session[:nickname]
      #email: session[:email]
      #password: session[:password]
      #password_confirmation: session[:password_confirmation]
    #)
    # プロフィールも同様にnew。未入力の項目はバリデーションに引っかからないように仮置き
    #@profile = Profile.new(
      #user: @user
      #birth_year: session[:birth_year]
      #birth_month: session[:birth_month]
      #birth_day: session[:birth_day]
      #first_name: session[:first_name]
      #last_name: session[:last_name]
      #first_name_kana: session[:first_name_kana]
      #last_name_kana: session[:last_name_kana]
      #post_first_name: "仮登録"
      #post_last_name: "太郎"
      #post_first_name_kana: "カリトウロク"
      #post_last_name_kana: "タロウ"
      #phone_number: '000-000-0000'
    #)
  end

  def sms_authentication
  end

  def sms_post
  end

  def sms_confirmation
  end

  def address
  end

  def second_validation
  end

  def card
  end

  def done
  end
end
