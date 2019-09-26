# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index
    @like = Like.all
  end

  def show; end

  def create
    @like = current_user.likes.new(user_id: params[:like][:user_id], post_id: params[:like][:post_id])
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "Can't like a post more than once"
      redirect_back(fallback_location: root_path)
    end
  end
end
