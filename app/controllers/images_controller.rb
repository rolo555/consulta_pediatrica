class ImagesController < ApplicationController
  active_scaffold :image do |conf|
    conf.columns = [:image]
  end
end
