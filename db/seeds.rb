puts "------------------------------------------------------------"
puts "-  !   COMMAND K  - will clear all prior console clutter   -"
puts "------------------------------------------------------------"
require 'pp'
require 'faker'
User.delete_all
Post.delete_all
if User.count == 0
	usercounter = 0
	until usercounter == 24
		user = User.create(user_name: Faker::Name.name,
                	email: Faker::Internet.email,
                	password: '1234',
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
puts "-              User and Post created                       -"
puts "------------------------------------------------------------"
