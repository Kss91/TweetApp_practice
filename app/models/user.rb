class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :posts, dependent: :destroy
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def posts
    return Post.where(user_id: self.id)
  end

  def follow(user_id)
    relationships.create(folloewd_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(folloewd_id: user_id).destroy
  end

  def following?
    followings.include?(user)
  end

end
