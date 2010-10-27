class HospitalExpensesController < ApplicationController
  active_scaffold :hospital_expenses do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:is_always_used, :concept, :price]

    #Configuración de cómo se mostrará la columna price
    conf.columns[:price].options[:format] = :currency
    conf.columns[:price].options[:i18n_options] = { :precision => 0 }
  end
end
