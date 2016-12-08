class PostsController < ApplicationController
  before_action :find_post, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all    
  end

  def show    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your Post successfully saved!"
      redirect_to @post
    else
      render 'new'      
    end
  end

  def edit    
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated successfully!"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash.now[:danger] = "Post was deleted!"
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end
end
