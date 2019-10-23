# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @comment = Comment.all
  end

  def create
    cpar = params[:comment]
    @comment = current_user.comments.new(text: cpar[:text], user_id: cpar[:user_id], post_id: cpar[:post_id])
    if @comment.save
      flash[:success] = 'Comment send'
    else
      flash[:warning] = 'Something went wrong, make sure the comment is long enough'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
