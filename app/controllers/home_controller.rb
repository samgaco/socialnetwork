# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[index new]
  def index
    @posts = Post.all
    @comments = Comment.all
    @post = Post.new
    @comment = Comment.new
    @like = Like.new

  end

  def new; end

  def edit; end
end
