class MainController < ApplicationController

	def index
		@article1=Article.where(:category_id=>1).first
		a=Category.where(:parent_id=>2)[0].articles.first
		@article2=a
		@article3=Article.where(:category_id=>3).first
		@article4=Article.where(:category_id=>4).first
	end

	def sign
		render :layout => 'content_layout'
	end

	def sign_in
		@user=User.where(:username=>params[:user][:username].downcase,:encrypted_password=>Digest::MD5.hexdigest(params[:user][:password]+"hadhada")).last
		if @user
			session[:user]=@user
			redirect_to dashboard_index_path
		else
			flash[:alert]="خطأ في اسم المستخدم او كلمة المرور"
			redirect_to sign_main_index_path and return
		end

	end

	def sign_out
		session[:user]=nil
		@user=nil
		flash[:info]="تم الخروج"
		redirect_to sign_main_index_path
	end

	def signup
		render :layout => 'content_layout'
	end

	def sign_up
		params.permit!
		params[:user].each{|k,v| v.downcase! rescue v}
		@user=User.new(params[:user])
		@user.encrypted_password=Digest::MD5.hexdigest(params[:user][:password]+"hadhada")
		if @user.save
			session[:user]=@user.id
			redirect_to dashboard_index_path,:flash => { :success => "تم إنشاء المستخدم" } and return
		else
			redirect_to signup_main_index_path,:flash => { :alert => "لم يتم إنشاء المستخدم" } and return
		end
	end

	def check_email
    	exists = false
    	if email = params[:email].downcase
    	  	exists = User.where(:email => email).exists?
    	end
    	
    		if exists
    	  		render :text => 'already taken', :status => 203 and return
    		else
    	  		render :text => "available", :status => 202 and return
    		end
    end

    def check_username
    	exists = false
    	if username = params[:username].downcase
    	  		exists = User.where(:username => username).exists?
    	end
	
	    	if exists
	    	  render :text => 'already taken', :status => 203 and return
	    	else
	    	  render :text => "available", :status => 202 and return
    		end
    end


end
