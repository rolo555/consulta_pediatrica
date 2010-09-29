class AllergiesController < ApplicationController
  active_scaffold :allergy do |conf|
    conf.list.per_page = 10
    conf.search.live = true
    
    conf.columns = [:substance, :reaction, :patient]
  end
end
