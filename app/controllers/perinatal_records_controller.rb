class PerinatalRecordsController < ApplicationController
  active_scaffold :perinatal_record do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:number_of_pregnancy, :childbirth, :cesarea, :abortions, :weight, :height, :head_circumference, :body_perimeter, :weeks_of_gestation, :apgar1, :apgar2, :type_of_birth, :jaundice, :observations ]

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:number_of_pregnancy, :weight, :height, :weeks_of_gestation, :type_of_birth ]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :patient

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]
  end
end
