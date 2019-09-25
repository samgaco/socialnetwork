class LikesController < ApplicationController

      def new 
        @like = Like.new
      end 
      
      def index 
        @like = Like.all 
      end
      
      def show 
      end
  
    def create 
        @like = current_user.likes.new(user_id: params[:like][:user_id], post_id: params[:like][:post_id] )
        @like.save
    end 
end
