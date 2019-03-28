# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

guids = (0..4).map { SecureRandom.uuid }

(1..100).each do |i|
  Tracking
    .where(
      guid: guids.sample,
      location: Faker::Internet.url,
      accessed_at: i.minutes.ago
    ).first_or_create!
end
