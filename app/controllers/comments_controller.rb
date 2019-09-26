# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @comment = Comment.all
  end

  def create
    @comment = current_user.comments.new(text: params[:comment][:text], user_id: params[:comment][:user_id], post_id: params[:comment][:post_id])
    if @comment.save
      flash[:success] = 'Comment send'
      redirect_back(fallback_location: root_path)
    else
      flash[:warning] = 'Something went wrong, make sure the comment is long enough'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
