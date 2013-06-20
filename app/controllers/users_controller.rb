class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index, :show]

  def index
	@users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
	
	if not current_user
		@user.profile_id = 3
	end
		
	if @user.save
		redirect_to articles_path, :notice => 'Usuário cadastrado com sucesso!'
	else
		render :action => 'new'
	end
  end

  def show
  
	@user = User.find(params[:id])
  
  end  
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user

	if @user.update_attributes(params[:user])
		redirect_to articles_path, :notice => 'Informações de usuário alteradas com sucesso!'
	else
		render :action => 'edit'
	end
  end
end