class HospitalExpensesController < ApplicationController
  active_scaffold :hospital_expenses do |conf|
    conf.columns = [:concept, :price, :is_always_used]
  end
end
