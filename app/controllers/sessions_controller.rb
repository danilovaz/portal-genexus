class SessionsController < ApplicationController

	def create
		if user = User.authenticate(params[:nickname], params[:password])
			session[:user_id] = user.id
			redirect_to root_path, :notice => "Logado com sucesso"
		else
			flash.now[:alert] = "Usuário/senha inválidos."
			render	:action => 'new'
		end
	end
	
	def destroy
		reset_session
		redirect_to root_path#, :notice => "Você foi desconectado com sucesso."

	end
	
end