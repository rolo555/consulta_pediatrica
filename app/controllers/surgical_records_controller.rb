class SurgicalRecordsController < ApplicationController
  active_scaffold :surgical_records do |conf|
    conf.columns = [:date, :pathology, :procedure, :patient]
  end
end
