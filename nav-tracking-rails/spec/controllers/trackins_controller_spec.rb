require 'rails_helper'

RSpec.describe TrackingsController, type: :controller do
  render_views

  it 'shows only 50 records' do
    (0..55).map do |i|
      FactoryBot.create(:tracking, guid: "##{i} days from now", accessed_at: i.days.from_now)
    end

    get :index

    (6..55).to_a.each do |i|
      expect(subject.response.body).to be_include("##{i} days from now")
    end

    (0..5).each do |i|
      expect(subject.response.body).not_to be_include("##{i} days from now")
    end
  end
end
