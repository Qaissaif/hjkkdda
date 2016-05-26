class SoundController < ApplicationController
	before_filter :authenticate, except: [:index]
	skip_load_and_authorize_resource :only=> [:index]
	layout "admin_layout"

	def index
		@sounds=Sound.all
		render :layout => 'content_layout'
	end

	def edit
		@sound= Sound.find(params[:id])
	end

	def destroy
		sound = Sound.find(params[:id])
    	sound.destroy
    	flash[:alert]= "تم حذف المقطع"
    	redirect_to sounds_sound_index_path
  	end

  	def new
  		@sound=Sound.new
  	end

  	def create
  		if params[:sound]
			params.permit!
			sound=Sound.create(params[:sound])
			sound.save
		end

		flash[:success]= "تم إنشاء المقطع"
		redirect_to dashboard_index_path
  	end

  	def update
  		if params[:sound]
			params.permit!
			sound=Sound.find(params[:sound])
			sound.update(params[:sound])
			sound.save
		end

		flash[:success]= "تم تعديل المقطع"
		redirect_to sounds_sound_index_path
  	end

  	def sounds
  		@sounds=Sound.all
  	end

end
