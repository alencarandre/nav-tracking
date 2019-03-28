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

require 'rails_helper'

RSpec.describe Tracking, type: :model do
  describe '#validations' do
    subject { FactoryBot.build(:tracking) }

    it { should validate_presence_of(:guid) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:accessed_at) }
    it { should validate_uniqueness_of(:guid).scoped_to([:location, :accessed_at]).case_insensitive }
  end

  context 'when search record' do
    subject { FactoryBot.create(:tracking, guid: 'iNsEnSiTiVe', location: 'HTTP://iNsEnSiTiVe.CoM') }

    it 'case insensitive search for guid' do
      is_expected.to eq(Tracking.where(guid: 'insensitive').first)
    end

    it 'case insensitive search for location' do
      is_expected.to eq(Tracking.where(location: 'http://insensitive.com').first)
    end
  end
end
