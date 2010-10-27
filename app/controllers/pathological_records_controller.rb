class PathologicalRecordsController < ApplicationController
  active_scaffold :pathological_records do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:date, :diagnosis, :treatment]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns.add :patient

    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => false }
  end
end
