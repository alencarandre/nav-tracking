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

class Tracking < ApplicationRecord
  validates :guid, :location, :accessed_at, presence: true
  validates :guid, uniqueness: { scope: [:location, :accessed_at] }

  scope :order_accessed_at_desc, -> { order('accessed_at DESC') }
end
