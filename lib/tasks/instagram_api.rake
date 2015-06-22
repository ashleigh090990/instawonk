namespace :instagram_api do
  desc "Gets user data from Instagram API"
  task get_user_data: :environment do
    user = User.find_by checked_at: nil
    user.checked_at = Time.now
    user.save
    puts user.username
  end

  desc "Gets lists of users from Instagram API and adds them to DB"
  task get_users: :environment do
    5.times do |i|
     User.create(username: Faker::Internet.user_name,
                  full_name: Faker::Name.name,
                  profile_picture: Faker::Avatar.image,
                  bio: Faker::Company.catch_phrase,
                  website: Faker::Internet.url,
                  media: rand(500),
                  follows: rand(10000),
                  followed_by: rand(10000))
    end


  end

end
