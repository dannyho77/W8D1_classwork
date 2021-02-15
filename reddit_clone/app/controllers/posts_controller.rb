class PostsController < ApplicationController
    before_action :require_logged_in, except: [:show]

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        
        @post.author_id = current_user.id
         
        debugger 
      

        # param titles.each  do  |title| 
            #add it to the sub_post table
                    # sp = SubPost.new(postid and subid)
                        # sp.save
        # params[:titles][i]
        p params

        titles_list = param[:titles]
        titles_list.each do |title|
            temp_sub = Sub.find_by_title(title)
            SubPost.create(sub_id: temp_sub.id, post_id: @post.id)
        end




        if @post.save
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        if @post && current_user.id == @post.author_id
            render :edit
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post && current_user.id == @post.author_id
            if @post.update(post_params)
                redirect_to sub_url(@post.sub_id)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end
end
