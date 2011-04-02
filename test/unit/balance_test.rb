require 'test_helper'

class BalanceTest < ActiveSupport::TestCase
  should validate_presence_of :date_start
  should validate_presence_of :date_finish

  context "method validate_date" do
    should "add an error if date_start is greater than date_finish" do
      balance = Balance.new :date_finish => Date.yesterday-1
      assert_bad_value balance, :date_start, Date.yesterday, "no puede ser mayor que Fecha final"
    end

    should "not add an error if date_start is lower than date_finish" do
      balance = Balance.new :date_finish => Date.yesterday
      assert_good_value balance, :date_start, Date.yesterday-1, "no puede ser mayor que Fecha final"
    end

    should "add an error if date_start is greater than today" do
      balance = Balance.new
      assert_bad_value balance, :date_start, Date.tomorrow, "no puede ser mayor que hoy"
    end

    should "add an error if date_finish is greater than today" do
      balance = Balance.new
      assert_bad_value balance, :date_finish, Date.tomorrow, "no puede ser mayor que hoy"
    end
  end

end
