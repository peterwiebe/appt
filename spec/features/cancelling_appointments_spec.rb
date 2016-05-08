require "rails_helper"

RSpec.feature "Users can cancel appointments" do
  scenario "successfully" do
    FactoryGirl.create(:appointment, date: "June 1, 2016")

    visit "/"

    click_link "2016-06-01"
    click_link "Cancel Appointment"

    expect(page).to have_content "Appointment has been cancelled."
    expect(page.current_url).to eq appointments_url
    expect(page).to have_no_content "2016-06-01"
  end
end
