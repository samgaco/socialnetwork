class FriendshipsController < ApplicationController

    def new
      @friendship = Friendship.new
    end 

    def create 
        fpar = params[:friendship]
        @friendship = Friendship.new({:status => fpar[:status], :user_id => fpar[:user_id], :friend_id => fpar[:friend_id]})
        if @friendship.save 
            flash[:success] = "Invitation sent"
        else  
            flash[:danger] = "Something went wrong :("
        end 
        redirect_back(fallback_location: root_path)
    end 

    def edit
        @user = current_user 
        @request = Friendship.find_by(friend_id: fpar[:friend_id] )
    end 

    def update 
        fpar = params[:friendship] 
        @user = current_user 
        @request = Friendship.all.find(fpar[:req_id] )
    
        @request.status = true 
    
        if @request.save 
            flash[:success] = "Invitation accepted"
        else  
            flash[:danger] = "Something went wrong :("
        end 
        redirect_back(fallback_location: root_path)
      end 



    private 

    def friendship_params 
        params.require(:post).permit(:status)
    end 
end
