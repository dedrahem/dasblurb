class User < ActiveRecord::Base
  before_save { self.email = email.downcase}
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :password, length: { minimum: 4 }, allow_blank: true
  validates :user_name, presence: true, length: {maximum: 48}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    #  uniqueness: true

  # will define the prototype timeline or feed
  # refer to Following Users for complete implementation of feature #
  # ? mark below is used to escape the id before the SQL query
  # avoiding an SQL injection.  This is a good technique.
  # the use of feed is about to become very convoluted ! requiring an
  # @feed_items instance variable for the user's feed, and then a timeline
  # feed partial to the timeline display page.   !!!! yikes.
  def feed
    Post.where("user_id=?",id)
    puts "Status: User Model feed method"
  end
# /  the above is equivalent to : 582   /
# /  def feed                           /
# /    posts                            /
# /  end                                /


end
# /       - - - -   END OF USER MODEL        - - - -         / #


# /  has_secure_password go see api:rubyonrails:org/                /
# / classes/ActiveModel/SecurePassword/ClassMethods.html            /
# / Adds methods to set and authenticate against a BCrypt password. /
# / requires a password_digest attribute, requires bcrypt (~)       /
# / The following validations are added automatically:              /
# / Password must be present on creation                            /
# / Password length should be less than or equal to 72 characters   /
# / Confirmation of password (via password_confirmation attribute)  /
# / has_secure_password &
# /  validates :password, length: { minimum: 4 }, allow_blank: true /
# / work together  !!                                               /
# / allow blank allows an exception to the minimum length of pass   /
# / word, shoud the password be blank when making a user update     /
# / this will not affect new user sign up allowing a blank p-word   /
# / has_secure_password enforces presence validations upon          /
# / the creation of an object                                       /
# / the first line converts the email to lower case prior to save   /
# / test.rb for the actual test that this worked                    /
# / uniquess at the model level is implemented, but                 /
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
