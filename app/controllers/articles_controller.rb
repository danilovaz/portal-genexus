class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.published

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
	@article.user_id = current_user

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, :notice => "Artigo criado com sucesso."}
      else
        format.html {render action:"new" }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
     @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html {redirect_to @article, :notice => "Artigo editado com sucesso."}
      else
        format.html {render action:"edit"}
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy  
    @article = Article.find(params[:id])
    @article.destroy
	
    respond_to do |format|
      format.html {redirect_to articles_url, :notice => "Artigo excluído com sucesso."}
    end
  end
  
  def list
    @articles = Article.all

    respond_to do |format|
      format.html #index.html.erb
    end
  end
  
  def publish
  	@article = Article.find(params[:id])
  	
  	if @article.published_at
  		@article.published_at = nil
  	else
  		@article.published_at = Date.today
  	end
  	
  	if @article.save
		respond_to do |format|
			format.js
		end
	else
		respond_to do |format|
			format.js { render 'erro.js.erb' }
		end
	end
  end
end
