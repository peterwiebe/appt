class Appointment < ActiveRecord::Base
  validates :date, presence: true
  belongs_to :client, class_name: "User"
end
