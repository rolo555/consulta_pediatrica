class PatientPricesController < ApplicationController
  active_scaffold :patient_price do |conf|
    conf.columns.exclude :patients
    conf.columns = [:price_type, :amount]
  end
end
