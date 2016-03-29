class DashboardController < ApplicationController

	layout "admin_layout"
	

	def index
		
	end

	

	# def edit_info
	# end

	# def info
	# 	params.permit!	
	# 	if @user.update(params[:user])
	# 		redirect_to dashboard_index_path,:flash => { :success => "Info edited!" } and return
	# 	else
	# 		redirect_to edit_info_dashboard_index_path,:flash => { :alert => "Sorry could not edit info!" } and return
	# 	end
	# end

	# def edit_pass
	# 	params.permit!
	# 	@user.encrypted_password=Digest::MD5.hexdigest(params[:user][:password]+"supportdakwak")
	# 	if @user.update(params[:user])
	# 		redirect_to dashboard_index_path,:flash => { :success => "Info edited!" } and return
	# 	else
	# 		redirect_to edit_info_dashboard_index_path,:flash => { :alert => "Sorry could not edit info!" } and return
	# 	end
	# end

	# def edit_website
	# if params[:website]
	# 	params.permit!
	# 	request=Ticket.create(params[:website])
	# 	request.website_id=@current_website.id
	# 	request.status="pending"
	# 	 if request.save
	# 	 	flash[:success]= "Your request was sent, we'll contact you as soon as possible."
	# 	 	TicketMailer.update_request(request).deliver
	# 	 else
	# 	 	flash[:alert]= "Somthing went wrong. please try again. check our FAQs for more info."
	# 	 end
	# end
	# 	redirect_to dashboard_index_path
	# end

	# def add_types
	# end

	# def types
	# 	params.permit!	
	# 	@cats=Category.all
	# 	@website.chosen_categorys=[]
	# 	@cats.each do |cat|
	# 		if params[cat.id.to_s.to_sym]
	# 			if @website
	# 				@website.chosen_categorys<<cat.value
	# 				@website.save!
	# 			end
	# 		end
	# 	end
	# 	if @user.save!
	# 		redirect_to dashboard_index_path,:flash => { :success => "Categories edited!" } and return
	# 	else
	# 		redirect_to edit_info_dashboard_index_path,:flash => { :alert => "Sorry could not edit Categories!" } and return
	# 	end
	# end

	# def delete_account
	# 	if @user.destroy
	# 	session[:user]=nil
 #  		session[:user_steps]=nil
 #  		redirect_to root_path,:flash => { :alert => "Account was DELETED" }
 #  	    end
	# end

	# def contact_info
	# 	if !@current_website.contact
	# 		@contact=Contact.new
	# 	else
	# 		@contact=@current_website.contact
	# 	end
	# end

	# def contact
	# 	params.permit!
	# 	@contact=Contact.find_or_create_by(:website_id=>@website.id)
	# 	@contact.website_id=@website.id
	# 	if @contact.update(params[:contact])
	# 		flash[:success]="contact info added to website"
	# 		redirect_to dashboard_index_path
	# 	else
	# 		flash[:alert]="Error in contact entering"
	# 		redirect_to contact_info_dashboard_index_path
	# 	end

	# end

	# def edit_icon
	# end

	# def icon
	# 	post = params[:website][:avatar]
	# 	#extension = File.extname(params[:website][:avatar].original_filename)
	# 	f= post.open
	# 	File.write(File.expand_path("public/logos/#{@website.id}.png"),f.read)
	# 	@website.avatar="public/logos/#{@website.id}.png"
	# 	@website.save! rescue redirect_to dashboard_index_path,:flash => { :alert => "failed" } and return
	# 	redirect_to dashboard_index_path,:flash => { :success => "Added Icon" }

	# end

	# def logo_text
	# 	params.permit!
	# 	@website.logo_text=params[:website][:logo_text]
	# 	FileUtils.rm("public/logos/#{@website.id}.png") rescue nil
	# 	@website.avatar=nil
	# 	if @website.save!
	# 		redirect_to dashboard_index_path,:flash => { :success => "Added Icon" }
	# 	end
	# end

end
