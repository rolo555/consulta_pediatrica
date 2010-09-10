class PlacesController < ApplicationController
  record_select :per_page => 5, 
    :search_on => ['city', 'country'],
    :full_text_search => true

  active_scaffold :place do |conf|
    conf.columns.exclude :patients
  end
end
