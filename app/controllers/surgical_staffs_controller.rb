class SurgicalStaffsController < ApplicationController
  record_select :per_page => 5,
    :search_on => 'concept',
    :full_text_search => true

  active_scaffold :surgical_staffs do |conf|
    conf.columns = :is_always_present, :staff, :percentage
    
    conf.columns[:percentage].options[:format] = :percentage
    conf.columns[:percentage].options[:i18n_options] = { :precision => 1 }
  end
end
