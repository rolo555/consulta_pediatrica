class ConsultationPricesController < ApplicationController
  active_scaffold :consultation_price do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:default, :price_type, :amount]
  end
end
