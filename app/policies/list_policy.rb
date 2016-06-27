class ListPolicy < ApplicationPolicy
  def show?
    is_owner? || is_friends_with_owner?
  end

  def destroy?
    is_owner?
  end

  def create?
    is_owner? && has_lists_available?
  end

  def add_items?
    is_owner?
  end

  private

  def is_owner?
    user == record.user
  end

  def has_lists_available?
    true
  end

  def is_friends_with_owner?
    user.friends.include? record.user
  end
end
