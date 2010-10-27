class PlacesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['city', 'country'],
    :full_text_search => true

  active_scaffold :place do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:city, :country]
  end

  def index
    if params[:must_close]
      render :template => "close", :layout => false
    else
      list
    end
  end
end
