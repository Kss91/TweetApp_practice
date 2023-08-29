class Relationship < ApplicationRecord

  before_action :set_current_user

  belongs_to :follower, class_name:"User"
  belongs_to :folloewd, class_name:"User"

end
