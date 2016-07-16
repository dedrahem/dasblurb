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

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # will define the prototype timeline or feed
   def feed
    puts "   "
    puts "   "
    puts "                - - - - - - - - - -   USER MODEL ENTER - - - - - - - - "
    puts " "
    puts "$> Status: Now in the User Model for the .feed method.   FEED METHOD"
    puts " "
    puts "$> find using #(id.inspect) the vaulue of id is:  #{id.inspect}     >>>>>>"
    puts " "
    puts " "
    puts "$> find using #(@user_feed_id.inspect) the id of the feed user  :  #{@user_feed_id}     >>>>>>"
    puts " "
    puts "$> In line 38, Let @user_feed = Post.where('user_id=?',id) "
    puts "                  will go to the Post data retrieve the posts having a user_id of the"
    puts "                  post being the same as the id of our enterprising current_user,"
    puts "                  with id 4, because his name is easy to spell."
    puts "  "
    puts "@user_feed.each do |post|,    puts # {post.inspect} "
    puts "  "
    puts "Achtung!: What happens if you call, # {posts.inspect}  : FROM WITHIN THE EACH DO LOOP  !!."
    puts "  "
    # puts "What is in your # {posts.inspect} ? $> #{posts.inspect}  "
    puts "  "
    @user_feed = Post.where("user_id=?",id)
    @user_feed.each do |post|
      puts " "
      puts " #{post.inspect}"
    end
    puts "  "
    puts "  "
    puts "Achtung!: What happens if you call, # {@user_feed.inspect}  : YOU ARE NOW OUTSIDE THE LOOP ...."
    puts "  "
    puts "What is in your # {@user_feed.inspect} ? $> #{@user_feed.inspect}  "
    puts "  "
    puts "$>> OR, listed with an each do |feed|"
    @user_feed.each do |feed|
      puts " "
      puts " #{feed.inspect}"
    end
    puts "  "
    puts " "
    puts "              ********** - - - -    USER MODEL EXIT   - - - -   *********  "
    puts "  "
    puts "  "
    Post.where("user_id=?",id)
   end
# @posts = @user.posts.paginate(page: params[:page])
# /  the above is equivalent to : 582   /
# /  def feed                           /
# /    posts                            /
# /  end                                /

# uf 12.43 return a user's status feed, ! RAW ! SQL RUBY RAILS ! RAW !
  def feed
    # //Post.where("user_id (:following_ids) OR user_id = :user_id", following_ids:, following_ids, user_id: id) /
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  # a method to follow a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # unfollow a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # will RETURN TRUE is the current user is following the other user

  def following?(other_user)
    following.include?(other_user)
  end

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
