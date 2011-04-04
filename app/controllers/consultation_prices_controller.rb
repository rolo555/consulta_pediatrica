class ConsultationPricesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['price_type', 'amount'],
    :full_text_search => true

  active_scaffold :consultation_price do |conf|
    #Columnas que se mostrarán
    conf.columns = [:default, :price_type, :amount]

    #Configuracion de amount
    conf.columns[:amount].options[:format] = nil

    #Agregar a :default para que la búsqueda lo incluya
    conf.search.columns << :default
  end

  def index
    if params[:must_close]
      render :template => "close", :layout => false
    else
      list
    end
  end

  def warning_message
    if params[:selected] == "true"
      render :partial => 'messages', :locals => { :flash => {:warning => as_("unique default price warning")} }
    else
      render :text => ""
    end
  end

end
