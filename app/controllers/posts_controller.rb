# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def index
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
    else
      flash[:warning] = 'Post should have 20+ characters in the content of the post and a title'
    end
    redirect_back(fallback_location: root_path)
  end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
