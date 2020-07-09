FactoryBot.define do
  factory :comment do
    description { 'Ruby on Rails' }
    user_id { 1 }
    post_id { 1 }
  end
end
