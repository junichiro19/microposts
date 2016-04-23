class RelationshipsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
            
    end
    
    def destroy
        @user = current_user.following_relationships.find(params[:id]).followed
        current_user.unfollow(@user)
    end
    
    def show_follower
        @user = current_user.following_relationships.find(params[:id]).follower
    end
    
    def show_followed
        @user = current_user.follower_users
    end
    
end
