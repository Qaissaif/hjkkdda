class PlanerController < ApplicationController
	
	layout 'content_layout'
	skip_before_filter :current_user

	def index
	end

	def show
	end

	def download
		filename=params[:filename]
		send_file(
		"#{Rails.root}/public/plan/#{filename}.pdf",
		:filename => 'plan.pdf',
		:type => 'application/pdf'
		)
	end
end
