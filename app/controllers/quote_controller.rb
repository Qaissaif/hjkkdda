class QuoteController < ApplicationController

	before_filter :authenticate
	layout "admin_layout"

	def new
  	end

  	def create
    	tmp = params[:quote][:icon].tempfile
    	file = File.join("public/quotes","quote.png")
    	FileUtils.cp tmp.path, file
    	if file
			redirect_to dashboard_index_path,:flash => { :success => "تمت اضافة الصورة" } and return
		else
			redirect_to dashboard_index_path,:flash => { :alert => "لم يتم اضافة الصورة" } and return
		end
  	end
end
