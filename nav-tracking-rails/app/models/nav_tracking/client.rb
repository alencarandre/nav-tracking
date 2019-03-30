module NavTracking
  class Client
    def get_trackings
      response = JSON.parse(get('tracking').body)

      return [] if response['Messages'].blank?

      messages = response['Messages'].map do |message|
        {
          receipt_handle: message['ReceiptHandle'],
          tracking: JSON.parse(message['Body']).symbolize_keys
        }
      end
    end

    def unqueue_tracking(receipt_handle)
      JSON.parse(post('tracking/unqueue', receiptHandle: receipt_handle).body)
    end

    private

    def get(path)
      RestClient.get("#{base_url}/#{path}")
    end

    def post(path, payload = {})
      RestClient.post("#{base_url}/#{path}", payload.to_json)
    end

    def base_url
      "https://pf6sevgyxa.execute-api.sa-east-1.amazonaws.com/#{enviroment}"
    end

    def enviroment
      Rails.env
    end
  end
end
