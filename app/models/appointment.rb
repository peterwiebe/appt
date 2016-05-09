class Appointment < ActiveRecord::Base
  validates :date, :time, presence: true
  belongs_to :client, class_name: "User"

  def start_time
    (self.date.to_s + " " + self.time.to_s).to_datetime
  end
end
