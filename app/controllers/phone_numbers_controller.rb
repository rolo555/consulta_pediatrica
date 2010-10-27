class PhoneNumbersController < ApplicationController
  active_scaffold :phone_numbers do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:number]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns.add :patient
  end
end
