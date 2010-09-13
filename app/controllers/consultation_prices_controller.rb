class ConsultationPricesController < ApplicationController
  active_scaffold :consultation_price do |conf|
    conf.columns.exclude :patients
    conf.columns = [:price_type, :amount]
  end
end
