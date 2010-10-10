class SurgicalRecordsController < ApplicationController
  active_scaffold :surgical_records do |conf|
    conf.list.per_page = 10
    conf.search.live = true
    
    conf.columns = [:date, :pathology, :procedure, :patient]

    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => false }

  end
end
