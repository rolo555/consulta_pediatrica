class ApplicationRecordsController < ApplicationController
  active_scaffold :application_record do |conf|
    conf.columns = [:application_type, :date, :doctor_application, :vaccine]
    conf.list.columns.exclude :vaccine
    conf.columns[:vaccine].form_ui = :select
    conf.columns[:application_type].form_ui = :select
    conf.columns[:application_type].options = {:options => [:dosis, :refuerzo], :include_blank => true}
    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => true}
  end

#  def after_render_field(record, column)
#    if column.name == :doctor_application
#      record.doctor_application = params[:record][:doctor_application]
#    end
#  end
end
