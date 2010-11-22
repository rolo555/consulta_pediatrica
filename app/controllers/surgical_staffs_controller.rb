class SurgicalStaffsController < ApplicationController
  record_select :per_page => 5,
    :search_on => 'concept',
    :full_text_search => true

  active_scaffold :surgical_staffs do |conf|
    conf.columns = :is_always_present, :staff
  end
end
