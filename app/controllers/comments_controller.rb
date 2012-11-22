class CommentsController < ApplicationController
	respond_to :html, :json, :js
	before_filter :load_article, :except => :destroy
	before_filter :authenticate, :only => :destroy
	
	def create
		@comment = @article.comments.new(params[:comment])

		if @comment.save
			respond_to do |format|
				format.html { redirect_to @article, :notice => 'Obrigado pelo seu comentário!' }
				format.js
			end
		else
			respond_to do |format|
				format.html { redirect_to @article, :alert => 'Não foi possível adicionar comentário!' }
				format.js { render 'fail_create.js.erb' }
			end
		end
	end
	
	def destroy
		@article = current_user.articles.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to @article, :notice => 'Comentário deletado!'
	end
	
	private
		def load_article
			@article = Article.find(params[:article_id])
		end
end