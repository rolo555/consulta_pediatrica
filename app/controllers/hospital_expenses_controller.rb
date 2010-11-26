class HospitalExpensesController < ApplicationController
  record_select :per_page => 5,
    :search_on => 'concept',
    :full_text_search => true

  active_scaffold :hospital_expenses do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:is_always_used, :concept, :price]

    #Configuración de cómo se mostrará la columna price
    conf.columns[:price].options[:format] = :currency
    conf.columns[:price].options[:i18n_options] = { :precision => 0 }

    #Agregar a :is_always_used para que la búsqueda lo incluya
    conf.search.columns << :is_always_used
  end
end
