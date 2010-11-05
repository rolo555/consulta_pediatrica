class SurgeriesController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :pre_operatiove_diagnosis, :post_operative_diagnosis, :procedure, :complicacions
    end
    action.columns.add_subgroup "" do |group|
      group.add :sugeon, :anesthesia_doctor, :assistant
    end

    action.columns.add_subgroup "" do |group|
      group.add :total_amount, :hospital_amount
    end
  end
  
  active_scaffold :surgeries do |conf|
    
    conf.columns.exclude :patient, :anesthesia_doctor_amount, :assistant_amount, :instrumentalist, :surgion_amount, :istrumentalist

    conf.list.columns = :created_at, :pre_operatiove_diagnosis, :procedure, :total_amount, :surgion_amount



    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end
end
