class SurgicalRecordsController < ApplicationController
  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :pathology, :date, :procedure
    end
  end

  active_scaffold :surgical_records do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:pathology, :procedure]

    #Agregar a las columnas de listar la relación patient
    conf.list.columns = :aproximate_date, :pathology, :procedure

    conf.columns.exclude :year, :month, :day

    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
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
