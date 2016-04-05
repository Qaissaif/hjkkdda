class CommentController < ApplicationController
  load_and_authorize_resource :only=> [:destroy]
  before_filter :authenticate, only: [:destroy]


def new
  @comment = Comment.new
end

def create_comment
	params.permit!
  @article = Article.find(params[:article][:id])
  @comment = Comment.create(params[:comment])
  @comment.article_id = @article.id
  
  if @comment.save
            render :text => "<div class='row' id='#{@comment.id}'><div class='col-md-10 col-sm-10'><div class='panel panel-default arrow right'><div class='panel-body'><header class='text-right'><div class='comment-user'><i class='fa fa-user'></i> #{@comment.commentor}</div><span class='comment-date'><i class='fa fa-clock-o'></i> #{l(@comment.created_at, format: '%Y/%m/%d')}</span></header><div class='comment-post'><p>#{@comment.content}</p></div></div></div></div><div class='col-md-2 col-sm-2 hidden-xs'><figure class='thumbnail'><img class='img-responsive' src='/assets/avatar2.jpg'></figure></div></div>", :status => 202 and return
        else
            render :text => "لم يتم اضافة التعليق", :status => 203 and return
        end
end

def destroy
  comment=Comment.find(params[:id])
  comment.destroy
  render :text =>"#{params[:id]}", :status => 200 and return
  
end

end
