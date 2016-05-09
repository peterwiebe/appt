class AddClientToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :client, index: true
    add_foreign_key :appointments, :users, column: :client_id
  end
end
