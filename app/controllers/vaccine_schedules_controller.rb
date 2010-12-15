class VaccineSchedulesController < ApplicationController
  active_scaffold :vaccine_schedule do |conf|
    conf.columns[:application_type].form_ui = :select
    conf.columns[:application_type].options = {:options => [:dosis, :refuerzo], :include_blank => true}
  end
end
