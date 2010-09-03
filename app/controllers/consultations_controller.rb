class ConsultationsController < ApplicationController

  active_scaffold :consultation do |conf|
    #Configuración de las columnas que se mostrarán 
    conf.columns = [:weight, :height, :head_circumference, :anterior_fontanel, :temperature, :current_condition, :diagnosis, :medical_certificate, :recipe, :order, :laboratory, :amount]

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:created_at, :diagnosis, :recipe, :amount]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :patient

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]

  end
end
