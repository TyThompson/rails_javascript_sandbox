class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :items, through: :lists

  def friends
    ids  = Friendship.where(user_1: self).pluck :user_2_id
    ids += Friendship.where(user_2: self).pluck :user_1_id
    User.where(id: ids.uniq)
  end

  def floopy?
    false
  end
end
