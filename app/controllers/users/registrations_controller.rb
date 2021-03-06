class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]
  
  def after_sign_up_path_for(resource)
     guide_beginner_path
  end

  private
  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]
  end

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      flash.now[:recaptcha_error] = I18n.t('recaptcha.errors.verification_failed')
      respond_with_navigational(resource) { render :new }
    end
  end
end
