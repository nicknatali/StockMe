class UsersController < ApplicationController
  def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end
  
  def my_friends
    @friendships = current_user.friends
  end
  
  def search
    @users = User.search(params[:search_param])
    
    if @users
      # get users that arent the current user
      @users = current_user.except_current_user(@users)
      render partial: "friends/lookup"
    else
      # if no users found
      render status: :not_found, nothing: true
    end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    #saving friends
    if current_user.save
      redirect_to my_friends_path, notice: "Yay you've made a friend!!"
    else
      redirect_to my_friends_path, flash[:error] = "There was an error with adding user as friend"
    end
  end
  
  # show a user's stocks
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end