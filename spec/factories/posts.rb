FactoryBot.define do
  factory :post do
    description { 'Ruby on Rails' }
    avatar { '/assets/images/image.jpg' }
    user_id { 1 }
  end
end
