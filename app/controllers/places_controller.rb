class PlacesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['city', 'country'],
    :full_text_search => true

  active_scaffold :place do |conf|
    conf.columns.exclude :patients
    conf.create.action_after_create = 'close'
  end

  def close()
    if params[:must_close]
      render :template => "close", :layout => false
    else
      return_to_main
    end
  end
end
