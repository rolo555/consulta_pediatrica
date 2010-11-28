class HospitalizationsController < ApplicationController
  active_scaffold :hospitalization do |conf|
    conf.list.columns = :created_at, :room, :doctors_name
  end
end
