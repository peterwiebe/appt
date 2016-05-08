class Appointment < ActiveRecord::Base
  validates :date, presence: true
end
