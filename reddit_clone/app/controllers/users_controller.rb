class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy, :edit, :update ,:show, :index]


    def new
        @user  = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        
        # debugger

        if @user.save
            login!(@user)

            redirect_to user_url(@user)
        else
            # debugger
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end 

    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def index
        @users = User.all
        render :index
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy if @user
        # do we need to include a logout function or one that sets the session_token to nil?

        redirect_to new_user_url
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end


    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
