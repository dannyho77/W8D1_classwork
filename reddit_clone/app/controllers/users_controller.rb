class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy, :edit, :show, :index]

    
end
