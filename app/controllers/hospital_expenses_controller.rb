class HospitalExpensesController < ApplicationController
  active_scaffold :hospital_expenses do |conf|
    conf.columns = [:concept, :price, :is_always_used]

    #Configuración de cómo se mostrará la columna price
    conf.columns[:price].options[:format] = :currency
    conf.columns[:price].options[:i18n_options] = { :precision => 0 }
  end
end
