require 'rails_helper'

RSpec.feature "Users can create new appointments" do
  scenario "with valid inputs" do
    visit "/"

    click_link "New Appointment"

    fill_in "Date", with: "June 1, 2016"
    click_button "Make Appointment"

     expect(page).to have_content "Appointment has been created."
  end
end
