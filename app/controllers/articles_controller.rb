class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html #index.html.erb
      #format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html {redirect_to @article}#, notice: "Artigo criado com sucesso."}
        #format.json { render json: @article, status: :created, location: @article }
      else
        format.html {render action:"new" }
        #format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
     @article = current_user.articles.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html {redirect_to @article}#, notice: "Artigo editado com sucesso."}
        #format.json { head :no_content }
      else
        format.html {render action:"edit"}
        #format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html {redirect_to articles_url}
      #format.json { head :no_content }
    end
  end
  
  def list
    @articles = Article.all

    respond_to do |format|
      format.html #index.html.erb
      #format.json { render json: @articles }
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
