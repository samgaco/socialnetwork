# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'success'
      redirect_to root_path
    else
      flash[:warning] = 'something went wrong, make sure you have more than 20 characters in the content of the post, and a title'
      redirect_to root_path
    end
  end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
