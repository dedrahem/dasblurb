# dasblurb

# Database Reminders - BECAUSE !!

#  rake db:setup will create the database, load schema and
#  initialize it with the seed data.
# Resetting the Database ---
# rake db:reset will drop the database and set it up again
# rake db:reset ='s doing a >rake db:drop followed by doing
# a >rake db:setup
# rake db:drop deletes the data
# ???? rake db:drop db:create db:migrate ?????
# $ rake db:migrate produced a rake aborted!
# ActiveRecord::NoDatabaseError: FATAL:  database "dasblurb_development" does # not exist
# created Add_Index_to_Users_Email, performed the migration
# and the migration failed - had existing duplicates in database
# dropped table, migration still failed, closed all,
# close terminal close session
# $>rake db:create  okay that worked !
#


# Douglass-MBP:dasblurb $ rake db:create
# Douglass-MBP:dasblurb $ rake db:migrate
# CreateUsers: migrating
# create_table(:users)
# : migrated
#  CreatePosts: migrating
# create_table(:posts)
#  CreatePosts: migrated
#  ActsAsFollowerMigration: migrating
# create_table(:follows, {:force=>true})
# add_index(:follows, ["follower_id", "follower_type"],
# {:name=>"fk_follows"})
# add_index(:follows, ["followable_id", "followable_type"],#  
# {:name=>"fk_followables"})
# ActsAsFollowerMigration: migrated
# AddIndexToUsersEmail: migrating
# add_index(:users, :email, {:unique=>true})
# AddIndexToUsersEmail: migrated

# failing UsersControllerTest#test
# should_get_users_show_profile_page
# test "| should get users show profile page |" do
#   get :show
#   assert_response :success
#   assert_select "title", "Show User Profile | #{@base_title}"
# end
# the fix get :show, id: @ user.id
# to access an id'd show page
# took out bogus line in user  title, {@user.user_name})
# update setup in user test to add,
# @ user = users(:one) and update the user_yml for user id
# user show html line 7 was incorrect and not needed.
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# %%%%%%  Undefined method authenticate for nil class %%%%
#
# using a SEEDED user - or - a Sign_Up created user
# puts "Info: #{email} | #{password}"
# puts "Has User: #{user.present?}"
# puts "Correct Password: #{user.authenticate(password)}"
#
# if user && user.authenticate(password)
#   session[:user_id] = user.id
#
# BUT I AM ABLE TO ENTER USING A CREATED w/Sign_Up user
#
# NO METHOD ERROR IN SESSIONS CONTROLLER # create
#  at the rails console > User.find(27)
#  User Load (0.5ms)  SELECT  "users".* FROM "users"
#  WHERE "users"."id" = $1 LIMIT 1  [["id", 27]]
#  => #<User id: 27, user_name: "Rufus Dufus", email: nil,
#  password_digest: "$2a$10$MNy7BGjk0M1eovSt6ZsgyehqeeYpZVqzfXONU3NgcN4...",
#  created_at: "2016-06-13 14:47:48", updated_at: "2016-06-13 14:47:48"> #
#  irb(main):002:0>

# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
