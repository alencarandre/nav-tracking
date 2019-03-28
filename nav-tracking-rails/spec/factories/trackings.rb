# == Schema Information
#
# Table name: trackings
#
#  id          :bigint(8)        not null, primary key
#  guid        :citext           not null
#  location    :citext           not null
#  accessed_at :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :tracking do
    guid SecureRandom.uuid
    location Faker::Internet.url
    accessed_at Time.zone.now
  end
end
