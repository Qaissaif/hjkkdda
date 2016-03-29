class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :clear_session
  before_filter :load_user


   def access_denied
    flash[:alert]="Authintication error"
    redirect_to sign_main_index_path and return
  end

  def load_user
  	if session[:user]
  		@user=User.find session[:user]
  	end
  end

  def authe
    if !@user
        flash[:alert]="Authintication error. You need to sign in"
        redirect_to sign_main_index_path and return
    end
  end

  def clear_session
  	if action_name=="sign_out"
  		session[:user]=nil
  	end
  end


end
