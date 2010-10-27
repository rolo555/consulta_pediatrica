class FamilyRecordsController < ApplicationController
  active_scaffold :family_record do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:pathology, :relation_ship]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns.add :patient
  end
end
