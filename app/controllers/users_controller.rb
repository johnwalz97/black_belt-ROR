class UsersController < ApplicationController
    def new
        if current_user
            redirect_to '/'
        end
    end
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            flash[:errors] = user.errors.full_messages
            redirect_to '/signup'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
