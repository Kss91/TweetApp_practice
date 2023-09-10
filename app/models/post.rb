class Post < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :content, presence: true  
  validates :content, length:{maximum: 140}
  validates :user_id, presence: true

  def user
    return User.find_by(id: self.user_id)
  end

end
