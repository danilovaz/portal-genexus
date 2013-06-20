 class ApplicationController < ActionController::Base
  protect_from_forgery
  
   protected 
    # Retorna o usuário corrente ou nil(nulo) se não houver um
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    # Cria um helper do :current_user
    helper_method :current_user

    def authenticate
      logged_in? ? true : access_denied
    end

    def logged_in?
      current_user.is_a? User
    end

    helper_method :logged_in?

    def access_denied
      redirect_to login_path, :notice => "Por favor, efetue login para continuar." and return false
    end
 end