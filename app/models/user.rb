class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  validates :user_name, presence: true, length: {maximum: 48}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
end
# / uniquess at the model level is implemented, but         /
# / the database will still allow for copies of the same    /
# / email address, the database will need to be protected   /
# / using another dedicated routine........                 /
# / thus, create a database index on the email column       /
# / and require that the index be unique                    /
