class SurgeriesController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :pre_operative_diagnosis, :post_operative_diagnosis, :procedure, :complicacions
    end
    action.columns.add_subgroup "" do |group|
      group.add :sugeon, :anesthesia_doctor, :assistant
    end

    action.columns.add_subgroup "" do |group|
      group.add :total_amount, :hospital_amount, :instrumentalist_amount
    end
  end
  
  active_scaffold :surgeries do |conf|    
    conf.columns.exclude :patient, :anesthesia_doctor_amount, :assistant_amount, :instrumentalist, :surgion_amount, :istrumentalist, :images
    conf.list.columns = :created_at, :pre_operative_diagnosis, :procedure, :total_amount, :surgion_amount, :images

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end
end
