require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  it "handles a missing appointment correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(appointments_path)

    message = "The appointment you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

end
