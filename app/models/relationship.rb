class Relationship < ActiveRecord::Base
  # 622_623
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
