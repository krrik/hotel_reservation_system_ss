class Reservation < ActiveRecord::Base
  belongs_to :customer
  validates :customer_id, presence: true
  validates :checkin, presence: true
  validates :checkout, presence: true
  

end
