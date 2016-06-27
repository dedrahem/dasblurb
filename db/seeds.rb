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
	User.create(user_name: "Adam Admin",
							email: "adam@admin.org",
							password: "adamadmin",
							password_confirmation: "adamadmin",
							admin: true)
	until usercounter == 25
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
end
puts "------------------------------------------------------------"
puts "-              Seed Data Complete for User and Post        -"
puts "------------------------------------------------------------"
puts " "
