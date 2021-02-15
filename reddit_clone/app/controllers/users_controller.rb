class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy, :edit, :show, :index]


    def new
        @user  = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        @user.sub_id = params[:sub_id]

        if @user.save
            redirect_to user_url(@user)
        else
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

        render :new
    end

    def edit
        @user = User.find_by(id: params[:id])

        # what goes in here?
        render :show
    end


    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
