# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  name       :string(100)      not null
#  email      :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates :name,
    presence: true,
    length: { maximum: 100 }
  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 100 },
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
