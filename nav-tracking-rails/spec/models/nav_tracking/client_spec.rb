require 'rails_helper'

RSpec.describe NavTracking::Client, type: :model do
  let(:api_base_path) { 'https://pf6sevgyxa.execute-api.sa-east-1.amazonaws.com/test' }

  describe '#get_trackings' do
    let(:nav_tracking_api_response) do
      {
        "ResponseMetadata" => {"RequestId" => "7280014d-412d-51e2-a851-5454d407fa35"},
        "Messages" => [{
          "MessageId" => '0689bb0b-2fd7-432b-967e-67067b4c7521',
          "ReceiptHandle" => "tBj8gpGoBmLj4mVK1onpXSIu1kbDOYDyKBegKNJsmg==",
          "MD5OfBody" => "b696e2cb5f46dc9d48aa5cdbdb7f3f6c",
          "Body" => '{"guid":"GUID_1","location":"http://fake1.com","accessed_at":1553660394591}'
        }, {
          "MessageId" => 'b074d03d-8bdc-4a0a-b4c5-f834e3a67e46',
          "ReceiptHandle" => 'KQETF4R8TcAa8Pc6BdKpvRj7yWjPH77kXrptiNYVMxA==',
          "MD5OfBody" => '137f78a3282e58009dd4c919217611ca',
          "Body" => '{"guid":"GUID_2","location":"http://fake2.com","accessed_at":1553961453210}'
        }]
      }.to_json
    end

    it 'gives trackings' do
      stub_request(:get, "#{api_base_path}/tracking")
        .to_return(body: nav_tracking_api_response)

      expect(subject.get_trackings).to eq([
        {
          receipt_handle: 'tBj8gpGoBmLj4mVK1onpXSIu1kbDOYDyKBegKNJsmg==',
          tracking: {
            guid: 'GUID_1',
            location: 'http://fake1.com',
            accessed_at: 1553660394591
          }
        }, {
          receipt_handle: 'KQETF4R8TcAa8Pc6BdKpvRj7yWjPH77kXrptiNYVMxA==',
          tracking: {
            guid: 'GUID_2',
            location: 'http://fake2.com',
            accessed_at: 1553961453210
          }
        }
      ])
    end
  end

end
