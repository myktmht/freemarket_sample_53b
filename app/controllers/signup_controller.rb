class SignupController < ApplicationController

  def sms_authentication
    @profile = Profile.new
  end 

  def sms_confirmation
    @profile = Profile.new
  end 

  def sms_post
    @profile = Profile.new
    render sms_authentication_signup_index_path unless  profile_params[:phone_number].present?
    phone_number = profile_params[:phone_number].sub(/\A./,'+81')
    sms_number = rand(10000..99999)
    session[:sms_number] = sms_number
    client = Twilio::REST::Client.new(ENV["TWILLIO_SID"],ENV["TWILLIO_TOKEN"])
    begin 
      client.api.account.messages.create(from: ENV["TWILLIO_NUMBER"], to: phone_number, body: sms_number)
    rescue
      render "signup/sms_authentication"
      return false
    end
    redirect_to sms_confirmation_signup_index_path
  end

  def sms_check
    @profile = Profile.new
    sms_number = profile_params[:phone_number]
    if sms_number.to_i == session[:sms_number]
      redirect_to address_signup_index_path
    else
      render "signup/sms_confirmation"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:phone_number)
  end

end
