class ApplicationRecordsController < ApplicationController
  active_scaffold :application_record do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:application_type, :date, :doctor_application, :vaccine]

    #Desactivar enlace que abre la vacuna
    conf.columns[:vaccine].clear_link

    #Mostrar vaccine con un select
    conf.columns[:vaccine].form_ui = :select

    #Mostrar application_type con un select
    conf.columns[:application_type].form_ui = :select
    conf.columns[:application_type].options = { :options => [:dose, :reinforcement] }

    #Mostrar date hasta 30 años atras del año actual
    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year}

    conf.action_links.delete :help
  end
end
