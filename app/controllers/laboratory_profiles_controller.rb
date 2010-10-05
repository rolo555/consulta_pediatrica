class LaboratoryProfilesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :label => 'laboratory_profile_name'

  active_scaffold :laboratory_profiles do |conf|
    conf.list.per_page = 10
    conf.search.live = true 
    conf.list.columns = [:name, :text]
    conf.columns.exclude :created_at, :updated_at
  end
end
