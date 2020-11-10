30.times do |n|
  User.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		email: "test#{n+1}@example.com", 
		password: "password", 
		password_confirmation: "password"
	)
end

10.times do |index|
	Board.create!(
		user: User.offset(rand(User.count)).first,
		title: "タイトル#{index}",
		body: "本文#{index}"
	)
end