class Api::V1::ContactsController < ApplicationController
  def create
    contact = Contact
      .where(email: contact_params[:email])
      .first_or_initialize(name: contact_params[:name])

    if contact.save
      render json: response_success(contact)
    else
      render json: response_error(contact), status: 409
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

  def response_success(contact)
    contact.as_json(only: [:name, :email])
  end

  def response_error(contact)
    { error: contact.errors.full_messages.to_sentence }
  end
end
