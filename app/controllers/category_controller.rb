class CategoryController < ApplicationController

	layout 'content_layout'


	def index
		@category=Category.find(params[:id])

		if @category.id==2
			# cats=Category.find(id=2).sub_categories
			# @arts0=cats[0].articles
			# @arts1=cats[1].articles
			# @arts2=cats[2].articles
			# @arts3=cats[3].articles
		else
			@articles=@category.articles
		end
	end

	def show
	end
	
end
