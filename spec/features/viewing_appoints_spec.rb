require "rails_helper"

RSpec.feature "Users can view appointments" do
  scenario "with the appointment details" do
    appointment = FactoryGirl.create(:appointment, date: "June 1, 2016")

    visit "/"
    click_link "2016-06-01"
    expect(page.current_url).to eq appointment_url(appointment)
  end
end
