class SurgeryQuotationsController < ApplicationController
  active_scaffold :surgery_quotation do |conf|
    conf.columns[:hospital_expenses].form_ui = :record_select
  end
end
