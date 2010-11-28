class DoctorsNamesController < ApplicationController
  active_scaffold :doctors_name do |conf|
    conf.columns = [:name]
  end
end
