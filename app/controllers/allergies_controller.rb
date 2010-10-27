class AllergiesController < ApplicationController
  active_scaffold :allergy do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:substance, :reaction]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns.add :patient
  end
end
