class ConsultationPricesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['price_type', 'amount'],
    :full_text_search => true

  active_scaffold :consultation_price do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:default, :price_type, :amount]
  end
end
