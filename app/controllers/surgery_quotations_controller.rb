class SurgeryQuotationsController < ApplicationController
  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :days_of_hospitalization
      group.add :surgery_time
    end
    action.columns.add_subgroup "" do |group|
      group.add :hospital_expenses
      group.add :medical_expenses
      group.add :total_expenses if action.is_a? ActiveScaffold::Config::Show
    end
  end

  active_scaffold :surgery_quotation do |conf|
    conf.list.columns.exclude :hospital_expenses

    conf.columns[:hospital_expenses].form_ui = :record_select
    
    conf.columns[:medical_expenses].options[:format] = :currency
    conf.columns[:medical_expenses].options[:i18n_options] = { :precision => 0 }

    conf.list.columns << :total_expenses

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end
end
