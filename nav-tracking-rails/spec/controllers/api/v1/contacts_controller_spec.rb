require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  describe '#create' do
    context 'when contact does not exist' do
      subject { post :create, params: { contact: { name: 'Mozart', email: 'mozart@music.com' } } }

      it 'saves new contact' do
        expect {
          subject
        }.to change { Contact.count }
        .from(0)
        .to(1)
      end

      it 'gives success' do
        is_expected.to have_http_status(200)
      end

      it 'returns contact' do
        expect(subject.body).to eq('{"name":"Mozart","email":"mozart@music.com"}')
      end
    end

    context 'when contact already exist' do
      subject { post :create, params: { contact: { name: 'Mozart', email: 'mozart@music.com' } } }

      before do
        FactoryBot.create(:contact, name: 'Mozart', email: 'mozart@music.com')
      end

      it 'does not save new contact' do
        expect {
          subject
        }.not_to change { Contact.count }
      end

      it 'gives success' do
        is_expected.to have_http_status(200)
      end

      it 'returns contact' do
        expect(subject.body).to eq('{"name":"Mozart","email":"mozart@music.com"}')
      end
    end

    context 'when contact is invalid' do
      subject { post :create, params: { contact: { name: '', email: 'invalid@mail' } } }

      let(:errors) { double('ActiveRecord Error', full_messages: ['The error', 'Something wrong is not right.']) }

      before do
        allow_any_instance_of(Contact)
          .to receive(:save)
          .and_return(false)
        allow_any_instance_of(Contact)
          .to receive(:errors)
          .and_return(errors)
      end

      it 'does not save new contact' do
        expect {
          subject
        }.not_to change { Contact.count }
      end

      it 'gives http status 409' do
        is_expected.to have_http_status(409)
      end

      it 'gives error message' do
        expect(subject.body).to eq('{"error":"The error and Something wrong is not right."}')
      end
    end
  end
end
