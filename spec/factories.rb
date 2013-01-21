FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "secret"
    password_confirmation "secret"
    
    factory :admin do
          admin true
  end
end

factory :measure do
    reading "Lorem ipsum"
    user
  end
end