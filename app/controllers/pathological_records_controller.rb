class PathologicalRecordsController < ApplicationController
  active_scaffold :pathological_records do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = :date, :diagnosis, :treatment

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = :aproximate_date, :diagnosis, :treatment

    #Configuración de las columnas que se mostrarán al mostrar
    conf.show.columns = :aproximate_date, :diagnosis, :treatment
  end

  def map_date(record)
    record.year = params[:record]["date(1i)"]
    record.month = params[:record]["date(2i)"]
    record.day = params[:record]["date(3i)"]
  end

  def before_update_save(record)
    map_date(record)
  end

  def before_create_save(record)
    map_date(record)
  end
end
