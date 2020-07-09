FactoryBot.define do
  factory :comment do
    user_id { 1 }
    post_id { 1 }
    description { 'comment text' }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
