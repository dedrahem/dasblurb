class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :postbody, presence: true, length: {maximum: 175}
end
# corrected validates :postbody not :content
