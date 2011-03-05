class AllergiesController < ApplicationController
  active_scaffold :allergy do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:substance, :reaction]
  end
end
