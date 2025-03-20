class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:name])
        
        if !!@user && @user.authenticate(params[:password])
        
            session[:user_id] = @user.id
            message = "Você está dentro da conta!"
            redirect_to root_path, notice: message
        else
        
            message = "Algo deu errado! Verifique sua senha e o seu nome"
            redirect_to login_path, notice: message
        end
    end
    
    def current_user
        @current_user ||= session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
    end
    
    def destroy
        logout_url
        session.delete(:user_id)
        @current_user = nil
        message = "Você saiu da conta!"
        redirect_to root_url, notice: message
    end
end
