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

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'validations' do
    subject { FactoryBot.build(:contact) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(100) }
    it { should allow_value('fake@mail.com').for(:email) }
    it { should_not allow_value('wrong email').for(:email) }
  end
end
