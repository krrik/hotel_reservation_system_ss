class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customername
      t.string :phone
      t.string :email
      t.string :address
      t.timestamps 
    end
  end
end
