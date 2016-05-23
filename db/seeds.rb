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
		User.create(user_name: Faker::Name.name,
                	email: Faker::Internet.email,
                	password: Faker::Internet.password(8, 10),
                	created_at: Faker::Time.between(DateTime.now - 7, DateTime.now - 5),
			            updated_at: Faker::Time.between(DateTime.now - 4, DateTime.now))
  usercounter = usercounter + 1  #  selects the number of users that are created
	end
end
puts "------------------------------------------------------------"
puts "-              User create section completed               -"
puts "------------------------------------------------------------"
if Post.count == 0
	postcounter = 0
	until postcounter == 24
		Post.create(postbody: Faker::Hipster.sentence,
	                	user_id: user_name[postcounter].id,
	                	created_at: Faker::Time.between(DateTime.now - 7, DateTime.now - 5),
				            updated_at: Faker::Time.between(DateTime.now - 4, DateTime.now))
	postcounter = postcounter + 1
	end
end
puts "------------------------------------------------------------"
puts "-             Post  creat  complete                        -"
puts "------------------------------------------------------------"
