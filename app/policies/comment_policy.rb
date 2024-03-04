class CommentPolicy < ApplicationPolicy

  def create?
    author? || 
    !record.author.private? ||
    user.leaders.include?(record.author)
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    user == record.author
  end
end
