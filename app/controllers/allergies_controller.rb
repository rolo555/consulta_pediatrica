class AllergiesController < ApplicationController
 active_scaffold :allergy do |conf|
    conf.columns = [:substance, :reaction, :patient]
  end
end
