class UsersController < ApplicationController

    def show
        @user = User.find(session[:user_id])
    end

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update 
        @user = User.find(session[:user_id])
        @user.update(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def destroy
        User.destroy(session[:user_id])
        redirect_to root_path
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
