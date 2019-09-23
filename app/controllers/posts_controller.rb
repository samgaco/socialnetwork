class PostsController < ApplicationController
  def index
   # @posts = Post.all
    @posts= Post.all


  end

  def show
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "sent :D"
      redirect_to root_path
    else  
      flash[:danger] = "oops"
    end 
  end 

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
