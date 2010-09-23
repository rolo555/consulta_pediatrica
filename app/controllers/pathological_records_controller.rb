class PathologicalRecordsController < ApplicationController
  active_scaffold :pathological_records do |conf|
    conf.columns = [:date, :diagnosis, :treatment, :patient]
  end
end
