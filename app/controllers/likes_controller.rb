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
      flash[:success] = 'Like given'
    else
      flash[:danger] = 'Cant like a post more than once'
    end
    redirect_back(fallback_location: root_path)
  end
end
