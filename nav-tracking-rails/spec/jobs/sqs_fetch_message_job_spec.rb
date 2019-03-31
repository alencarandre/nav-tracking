require 'rails_helper'

RSpec.describe SqsFetchMessageJob, type: :job do
  describe '#perform' do
    let(:client) { double('NavTracking::Client') }

    before do
      allow(subject).to receive(:client).and_return(client)
      allow(client)
        .to receive(:unqueue_tracking)
        .with(any_args)
        .twice
      allow(client)
        .to receive(:get_trackings)
        .and_return([
          {
            receipt_handle: 'receipt_handle_1==',
            guid: 'GUID_1',
            location: 'http://fake1.com',
            accessed_at: 1553660394591
          }, {
            receipt_handle: 'receipt_handle_2==',
            guid: 'GUID_2',
            location: 'http://fake2.com',
            accessed_at: 1553961453210
          }
        ])
    end

    it 'saves trackings fetched' do
      expect { subject.perform_now }
        .to change { Tracking.count }
        .from(0)
        .to(2)
      expect(Tracking.pluck(:guid, :location))
        .to match_array([
          ['GUID_1', 'http://fake1.com'],
          ['GUID_2', 'http://fake2.com']
        ])
      expect(Tracking.pluck(:accessed_at).map(&:to_i))
        .to match_array([1553660394591, 1553961453210])
    end

    it 'remove from queue' do
      expect(client)
        .to receive(:unqueue_tracking)
        .with('receipt_handle_1==')
      expect(client)
        .to receive(:unqueue_tracking)
        .with('receipt_handle_2==')

      subject.perform
    end
  end
end
