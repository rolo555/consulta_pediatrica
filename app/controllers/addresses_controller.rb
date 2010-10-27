class AddressesController < ApplicationController
  active_scaffold :address do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:address]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns.add :patient
  end
end
