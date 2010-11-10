class SurgicalStaffsController < ApplicationController
  active_scaffold :surgical_staffs do |conf|
    conf.columns = :is_always_present, :staff, :percentage
    
    conf.columns[:percentage].options[:format] = :percentage
    conf.columns[:percentage].options[:i18n_options] = { :precision => 1 }
  end
end