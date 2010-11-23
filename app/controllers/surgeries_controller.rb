class SurgeriesController < ApplicationController
  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :pre_operative_diagnosis, :post_operative_diagnosis, 
        :procedure, :complications
    end
    action.columns.add_subgroup "amounts" do |group|
      group.add :total_amount, :hospital_amount, :doctors_percentage
    end
    action.columns.add_subgroup "" do |group|
      group.add :surgeries_surgical_staffs
    end
  end
  
  active_scaffold :surgeries do |conf|
    conf.columns.exclude :images, :income, :doctors_amount
    conf.list.columns = :created_at, :pre_operative_diagnosis, :procedure,
      :doctors_amount, :images

    conf.columns[:total_amount].options[:format] = nil
    conf.columns[:hospital_amount].options[:format] = nil

    conf.columns[:doctors_percentage].options[:format] = :percentage
    conf.columns[:doctors_percentage].options[:i18n_options] = { :precision => 0 }

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end
end
