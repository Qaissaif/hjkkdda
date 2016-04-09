class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :clear_session
  before_filter :current_user

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  # rescue_from Exception, with: :access_denied
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ::AbstractController::ActionNotFound, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::UnknownController, with: :render_404


   def access_denied
    flash[:alert]="يجب عليك تسجيل الدخول"
    redirect_to sign_main_index_path and return
  end

  def current_user
  	if session[:user]
  		@user=User.find session[:user]
  	end
  end

  def authenticate
    if !@user
        flash[:alert]="يجب عليك تسجيل الدخول"
        redirect_to sign_main_index_path and return
    end
  end

  def clear_session
  	if action_name=="sign_out"
  		session[:user]=nil
  	end
  end

  def routing
    render_404
  end

  def server
    render_500
  end

private
  def render_500(exception = nil)
     if exception
        logger.info "Rendering 500: #{exception.message}"
    end
    render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false
  end

private
  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
