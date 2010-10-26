class AddressesController < ApplicationController
  active_scaffold :address do |conf|
    #Excluir de todas las columnas la relación patient
    conf.columns.exclude :patient

    #Agregar a las columnas de listar la relación patient
    conf.list.columns << :patient
  end
end
