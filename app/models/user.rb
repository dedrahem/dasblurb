class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :posts
  validates :password, length: { minimum: 6 }
  validates :user_name, presence: true, length: {maximum: 48}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
end


# / uniquess at the model level is implemented, but          /
# / the database will still allow for copies of the same     /
# / email address, the database will need to be protected    /
# / using another dedicated routine........                  /
# / thus, create a database index on the email column        /
# / and require that the index be unique                     /
# ?  <<<<<<<<<<<<<<<<<<<<<<<<  >>>>>>>>>>>>>>>>>>>>>>>>>>>   /
# /  !!!!!!!      has secure password -- ability and        //
# /  r'qrmnt to have password_digest attibute in the model //
# /  allowing to save a secure hashed password_digest       /
# / attribute to the database.  a pair of VIRTUAL attributes /
# / called password and password_confirmation are assigned to the /
# / model object but DO NOT APPEAR in a table or column   /
# / of attributes.  What does appear is password_digest in the model /
# / and as _digest is NOT READABLE, that is how the cryptic store /
# / works it's magic, the password is not stored, a hash version is !!/
# / Ironically, has secure pword provides for the authenticate method of  /
# / returning the user , true, when the password is correct, which was /
# / more than likely the first and only objective of log in.  /
#/ REQUIRES bcrypt gem TO BE ADDED TO GEM FILE  !!!!!!!!!!!!! /
#/ has secure password, by nature ADDS AN AUTHENTICATE method to /
# / the corresponding model objects.   The method looks at the input
# / password determines the digest value of the input password and /
#/ compares the result to the stored digest password /
