FactoryGirl.define do
  factory :user do
    id 1
    name 'shivani'
    email 'shivani.gupta@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    avatar '/assets/images/image.jpg'
    small_bio 'test validation'
  end
  
  factory :user1 do
    id 2
    name ''
    email 'shivani.gupta@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    avatar '/assets/images/image.jpg'
    small_bio 'test validation'
  end

end
