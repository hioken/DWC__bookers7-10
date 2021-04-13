# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    begin
    super
    ThanksMailer.with(name: resource.name, email: resource.email).welcome_email.deliver_later
	  rescue => e
	  #e.exception_log
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
	    p e
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
    else
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		  p 'successfully'
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		  p '-------------------------------------------------------'
		end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
end

class Exception
  def exception_log(tracing: true)
    text = "\n"
    text << "\tError:    #{self.class}\n"
    text << "\tModel:    #{self.record.class}\n" if self.class.name.deconstantize == "ActiveRecord" && self.respond_to?(:record)
    text << "\tMassage:  #{self.message}\n"
      
    if tracing
      text << "\tBacktrace:\n"
      p self.class
      limit = ((self.class == ActiveRecord::RecordInvalid || self.class == ArgumentError) ? 16 : 30) # backtraceの出力行数
      cnt = 0
      self.backtrace.each do |trace|
        next unless trace.match?(/\/app\//)
        text << "\t\t" + trace + "\n"
        cnt += 1
        if cnt > limit
          cnt = "over #{limit}"
          text << "\t\t......\n"
          break
        end
      end
      text << "\ttrace_count: #{cnt.to_s}\n"
    else
      text << "\tBacktrace:  none\n"
    end
    Rails.application.config.exception_logger.info(text)
  end
end