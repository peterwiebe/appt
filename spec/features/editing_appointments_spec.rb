require "rails_helper"

RSpec.feature "Users can edit existing appointments" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    FactoryGirl.create(:appointment, date: "June 1, 2016", client_id: user.id)

    visit "/"
    click_link "2016-06-01"
    click_link "Edit Appointment"
  end

  scenario "with valid inputs" do
    # fill_in "Date", with: "July 1, 2016"
    page.find('#appointment_date').set("2016-07-01")
    click_button "Update Appointment"

    expect(page).to have_content "Appointment has been updated."
    expect(page).to have_content "2016-07-01"
  end

  scenario "with invalid inputs" do
    # fill_in "Date", with: ""
    page.find('#appointment_date').set("")
    click_button "Update Appointment"

    expect(page).to have_content "Appointment has not been updated."
  end
end
