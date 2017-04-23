class FriendshipsController < ApplicationController
  #Destroy friendship 
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to my_friends_path, notice: "You are no longer friends :("}
    end
  end
end