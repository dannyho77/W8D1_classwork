class SubsController < ApplicationController
    before_action :require_logged_in, except: [:index, :show]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def edit
        @sub = Sub.find(params[:id])
        mod = @sub.moderator
        if @sub && @sub.id == mod.sub_id    #get checked by TA
        render :edit
        end
    end

    def update
        @sub = Sub.find(params[:id])
        mod = @sub.moderator                #get checked by TA
        if @sub && @sub.id == mod.sub_id
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
