FactoryGirl.define do
    
  factory :account do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
 
  factory :user do
    name {Faker::Name.name }
    email {Faker::Internet.email }
    password {Faker::Internet.password(8) }
    location Location.create! 
    current_sign_in_ip {Faker::Internet.ip_v4_address}
    created_at Date.today
    updated_at Date.today
  end
  
  factory :post do
    with :user
    name {Faker::Post.name}
    content {Faker::Post.content}
  end
  
end