FactoryBot.define do
  factory :user do
    nickname {"yamada"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_frigana {"カタカナ"}
    first_name_frigana {"カタカナ"}
    date_of_birth {"1930-01-01"}
  end
end