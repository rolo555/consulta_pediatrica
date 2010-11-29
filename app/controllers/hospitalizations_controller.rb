class HospitalizationsController < ApplicationController
  active_scaffold :hospitalization do |conf|
    conf.list.columns = :created_at, :room, :hospitalization_follow_up
    conf.columns.exclude :hospitalization_follow_up
  end
end
