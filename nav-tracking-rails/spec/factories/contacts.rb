# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  name       :string(100)      not null
#  email      :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
  end
end
