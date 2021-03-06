class DrugsController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_drug

  active_scaffold :drugs do |conf|
    conf.columns = [:name, :how_often_in_hours, :how_often_in_weight, :recipe]
    conf.columns[:how_often_in_hours].options[:format] = nil
    conf.columns[:how_often_in_weight].options[:format] = nil
  end
end
