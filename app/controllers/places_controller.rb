class PlacesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['city', 'country'],
    :full_text_search => true

  active_scaffold :place 

  def index
    if params[:must_close]
      render :template => "close", :layout => false
    else
      list
    end
  end
end
