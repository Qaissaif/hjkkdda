class PlanerController < ApplicationController
	
	layout 'content_layout'
	before_filter :authenticate, except: [:index,:download]

	def index
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
