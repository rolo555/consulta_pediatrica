class SurgicalRecordsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :pathology, :procedure
    end
    action.columns.add_subgroup "Date" do |group|
      group.add :year, :month, :day
    end
  end

  active_scaffold :surgical_records do |conf|
    conf.list.per_page = 10
    conf.search.live = true
    
    conf.columns = [:year, :month, :day, :pathology, :procedure, :patient]

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show

  end
end
