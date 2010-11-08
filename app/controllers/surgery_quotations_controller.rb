class SurgeryQuotationsController < ApplicationController
  active_scaffold :surgery_quotation do |conf|
    conf.columns[:hospital_expenses].form_ui = :record_select
    
    conf.columns[:days_of_hospitalization].description = "days"
    conf.columns[:surgery_time].description = "hours"

    conf.columns[:medical_expenses].options[:format] = :currency
    conf.columns[:medical_expenses].options[:i18n_options] = { :precision => 0 }
  end
end
