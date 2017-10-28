class ArticleController < ApplicationController
	load_and_authorize_resource

	layout "admin_layout"

	before_filter :authenticate, except: [:show]

	def index
		 @articles=Article.all
	end

	def edit
		 @article = Article.find(params[:id])
	end

	def show
		@article=Article.find(params[:id])
		render :layout => 'content_layout'
	end

	def destroy
    	article = Article.find(params[:id])
    	article.destroy
    	File.delete(File.expand_path("public/images/#{article.id}.png")) rescue nil
    	flash[:alert]= "تم حذف المقال"
    	redirect_to article_index_path
  	end

	def new_article
		@article=Article.new
	end

	def create_article
		if params[:article]
			params.permit!
			article=Article.create(params[:article])
			keyword=params[:article][:title]
			keyword=keyword.gsub("?","")
			keyword=keyword.gsub(".","")
			keyword=keyword.gsub(",","")
			keyword=keyword.gsub("/","")
			article.title=keyword.downcase
			article.color=article.category.color
			article.save
		end

		flash[:success]= "تم إنشاء المقال"
		redirect_to add_icon_article_index_path(:id=>article.id)
	end


	def update
		article=Article.find(params[:id])
		article.category_id=params[:article][:category_id]
		article.content=params[:article][:content]
		article.color=article.category.color
		keyword=params[:article][:title]
		keyword=keyword.gsub("?","")
		keyword=keyword.gsub(".","")
		keyword=keyword.gsub(",","")
		keyword=keyword.gsub("/","")
		article.title=keyword.downcase
		article.save

		flash[:success]= "تم تعديل المقال"
		redirect_to article_index_path
	end

	def add_icon
		@article=Article.where(:id=>params[:id])
	end

	def icon
	    article=Article.find(params[:article][:id])
		tmp =params[:article][:icon].tempfile
    	file = File.join("public/images/","#{article.id}.png")
    	FileUtils.cp tmp.path, file
    	FileUtils.chmod 775, file
		# if post.content_type=="image/jpeg"
		# File.write(File.expand_path("public/images/#{article.id}.jpg"),f.read)
		# article.icon="public/images/#{article.id}.jpg"
		# else
		#File.write(File.expand_path("public/images/#{article.id}.png"),f.read)
		article.icon="public/images/#{article.id}.png"
		# end
		article.save! rescue redirect_to dashboard_index_path,:flash => { :alert => "لم يتم اضافة الصورة" } and return
		redirect_to dashboard_index_path,:flash => { :success => "تمت اضافة الصورة" }
	end

end
