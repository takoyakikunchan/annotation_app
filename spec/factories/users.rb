FactoryBot.define do
  factory :user do
    nickname              { 'aaaa' }
    email                 { 'mimimi@gmail.com' }
    password              { 'knbn0000' }
    password_confirmation { password }
  end
end
