class HospitalExpensesController < ApplicationController
  record_select :per_page => 5,
    :search_on => 'concept',
    :full_text_search => true

  active_scaffold :hospital_expenses do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:is_always_used, :concept, :frequency, :price]


    #Configuracion de frequency para que sea un selectbox
    conf.columns[:frequency].form_ui = :select
    conf.columns[:frequency].options = {:options => [:por_hora, :por_dia, :por_cirugia], :include_blank => ''}
    conf.columns[:frequency]

    #Configuración de cómo se mostrará la columna price
    conf.columns[:price].options[:format] = :currency
    conf.columns[:price].options[:i18n_options] = { :precision => 0 }

    #Agregar a :is_always_used para que la búsqueda lo incluya
    conf.search.columns << :is_always_used
  end
end
