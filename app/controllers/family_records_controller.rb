class FamilyRecordsController < ApplicationController
  active_scaffold :family_record do |conf|
    conf.columns = [:pathology, :relation_ship ]
  end
end
