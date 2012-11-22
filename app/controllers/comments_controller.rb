class CommentsController < ApplicationController
	respond_to :html, :json, :js
	before_filter :load_article, :except => :destroy
	before_filter :authenticate, :only => :destroy
	
	def create
		@newcomment = @article.comments.new(params[:comment])
		@newcomment.user_id = current_user.id
	
		if params[:commit].eql?('Cancel')
			respond_to do |format|
				format.js { render 'remove.js.erb' }
			end
		else
			if @newcomment.save
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
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to @article, :notice => 'Comentário deletado!' }
			format.js
		end
	end
	
	private
		def load_article
			@article = Article.find(params[:article_id])
		end
end