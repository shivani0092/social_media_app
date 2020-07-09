FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'User 1' }
    email { 'shivani.gupta@gmail.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    avatar { '/assets/images/image.jpg' }
    small_bio { 'test validation' }
  end

  factory :user1 do
    id { 2 }
    name { 'User 2' }
    email { 'shivani.guptatest@gmail.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    avatar { '/assets/images/image.jpg' }
    small_bio { 'test validation' }
  end
end
