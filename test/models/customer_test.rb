require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new(customername: "karthik", email: "k.jagilinki@gmail.com", phone: "4198199566", address: "Bowling Green,OH")
  end
  
  test "customer should be valid" do
    assert @customer.valid?
  end

  test "customername should be present" do
    @customer.customername = " "
    assert_not @customer.valid?
  end
  
  test "customername should not be too long" do
    @customer.customername = "a" * 41
    assert_not @customer.valid?
  end
  
  test "customername should not be too short" do
    @customer.customername = "aa"
    assert_not @customer.valid?
  end
  
  test "email should be present" do
    @customer.email = " "
    assert_not @customer.valid?
  end
  
  test "email length should be within bounds" do
    @customer.email = "a" * 101 + "@example.com"
    assert_not @customer.valid?
  end
  
  test "email address should be unique" do
    dup_customer = @customer.dup
    dup_customer.email = @customer.email.upcase 
    @customer.save
    assert_not dup_customer.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @customer.email = va
      assert @customer.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @customer.email = ia
      assert_not @customer.valid?, '#{ia.inspect} should be invalid'
    end    
  end
  
  
  
end
