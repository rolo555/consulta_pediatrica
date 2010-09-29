class SurgicalRecordsController < ApplicationController
  active_scaffold :surgical_records do |conf|
    conf.list.per_page = 10
    conf.search.live = true

    conf.columns = [:date, :pathology, :procedure, :patient]
  end
end
