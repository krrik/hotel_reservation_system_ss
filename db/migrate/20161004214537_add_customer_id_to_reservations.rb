class AddCustomerIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :customer_id, :integer
  end
end
