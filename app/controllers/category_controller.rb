class CategoryController < ApplicationController

	layout 'content_layout'


	def index
		@category=Category.find(params[:id])
		cats=[]
		if @category.id==2	
			Category.all.each do |cat|
				if cat.parent_id!=nil && cats.length < 4
				cats<<cat
				end
			end
			@cats0=cats[0]
			@cats1=cats[1]
			@cats2=cats[2]
			@cats3=cats[3]
		else
			@articles=@category.articles
		end
	end

	def show
	end
	
end
