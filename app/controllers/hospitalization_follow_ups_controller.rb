class HospitalizationFollowUpsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :date, :room
    end
    action.columns.add_subgroup "Clinical course" do |group|
      group.add :currentCondition, :physicalExamination, :diagnosis, :treatment
    end
    action.columns.add_subgroup "Medical prescription" do |group|
      group.add :prescription
    end
  end
  active_scaffold :hospitalization_follow_up do |conf|
    conf.list.columns = :date, :currentCondition, :physicalExamination, :diagnosis, :treatment, :prescription

    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => false}

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end

  def do_new
    super
    @record.set_room
  end

  def after_create_save(record)
    @record.change_room
  end

  def after_update_save(record)
    @record.change_room
  end

end
