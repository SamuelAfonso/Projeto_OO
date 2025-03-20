class UsersController < ApplicationController

def index
end

def show
    @user = User.find(params[:id])
end

            def new
                    @user = User.new
            end
            def create
                @user = User.new(user_params)
                        if @user.save
                                session[:user_id] = @user.id
                                redirect_to root_path(@user), notice: "Usuário foi criado!"
                        else
                                render action: :new
                        end
            end
            
            private
            
            def user_params
                params.require(:user).permit(:name, :email, :password, :password_confirmation)
            end
end
