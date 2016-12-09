class PostsController < ApplicationController
  before_action :find_post,           :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  :except => [:index, :show]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).sorted
  end

  def show    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save      
      redirect_to @post, notice: "Nice! Post saved!"
    else
      render 'new'      
    end
  end

  def edit    
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post Updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy    
    redirect_to root_path, alert: "You just deleted that post"
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end
end
