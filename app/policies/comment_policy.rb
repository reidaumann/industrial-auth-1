class CommentPolicy < ApplicationPolicy
  attr_reader :current_user, :comments

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

end
