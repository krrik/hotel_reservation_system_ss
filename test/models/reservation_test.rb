require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  
  def setup
    @customer = Customer.create(customername: "deep", email: "deep.shah@gmail.com")
    @reservation = @customer.reservations.build(checkin: "2016-10-12 12:00:00", checkout: "2016-10-13 12:00:00")
  end
  
  test "reservation should be valid" do
    assert @reservation.valid?
  end
  
  test "customer_id should be present" do
    @reservation.customer_id = nil
    assert_not @reservation.valid?
  end
  
  test "checkin should be present" do
    @reservation.checkin = " "
    assert_not @reservation.valid?
  end
  
  test "checkout should be present" do
    @reservation.checkout = " "
    assert_not @reservation.valid?
  end
  
end
