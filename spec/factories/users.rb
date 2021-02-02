FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_frigana { 'カタカナ' }
    first_name_frigana { 'カタカナ' }
    date_of_birth { '1930-01-01' }
  end
end
