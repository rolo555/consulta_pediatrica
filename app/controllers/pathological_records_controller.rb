class PathologicalRecordsController < ApplicationController
  active_scaffold :pathological_records do |conf|
    conf.list.per_page = 10
    conf.search.live = true

    conf.columns = [:date, :diagnosis, :treatment, :patient]
  end
end
