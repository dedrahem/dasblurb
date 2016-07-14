puts "------------------------------------------------------------"
puts "-  !   COMMAND K  - will clear all prior console clutter   -"
puts "------------------------------------------------------------"
require 'pp'
require 'faker'
User.delete_all
Post.delete_all
puts " "
puts "------------------------------------------------------------"
puts "-             Seeding Data for user and post               -"
puts "------------------------------------------------------------"
puts " "

if User.count == 0
	usercounter = 0
	User.create(user_name: "Adam McAdmin",
							email: "adam@admin.org",
							password: "adamadmin",
							password_confirmation: "adamadmin",
							admin: true)
	until usercounter == 70
		user = User.create(user_name: Faker::Name.name,
                	email: Faker::Internet.email,
                	password: '12345',
									password_confirmation: '12345',
                	created_at: Faker::Time.between(DateTime.now - 7, DateTime.now - 5),
			            updated_at: Faker::Time.between(DateTime.now - 4, DateTime.now))
		Post.create(postbody: Faker::Hipster.sentence,
									user_id: user.id,
									created_at: Faker::Time.between(DateTime.now - 7, DateTime.now - 5),
									updated_at: Faker::Time.between(DateTime.now - 4, DateTime.now))
  usercounter = usercounter + 1  #  selects the number of users that are created
	end
	puts "  "
	puts "  "
	puts "  "
	puts "------------------------------------------------------------"
	puts "-       Seeding the Followed / Following Relations         -"
	puts "------------------------------------------------------------"
	puts "  "
	puts "  "
	users = User.all
	user = users[3]
	following = users[4..35]
	followers = users[8..30]
	following.each {|followed| user.follow(followed)}
	followers.each {|follower| follower.follow(user)}
	puts " "
	puts " "
end
puts "------------------------------------------------------------"
puts "-     Seed Data Complete - User and Post and Relation      -"
puts "------------------------------------------------------------"
puts " "
