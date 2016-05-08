require 'rails_helper'

RSpec.feature "Users can create new appointments" do
  before do
    visit "/"

    click_link "New Appointment"
  end

  scenario "with valid inputs" do

    fill_in "Date", with: "June 1, 2016"
    click_button "Make Appointment"

    expect(page).to have_content "Appointment has been created."

    appointment = Appointment.find_by(date: "June 1, 2016")
    expect(page.current_url).to eq appointment_url(appointment)
  end

  scenario "with invalid inputs" do

    click_button "Make Appointment"

    expect(page).to have_content "Appointment has not been created."
    expect(page).to have_content "Date can't be blank"
  end
end
