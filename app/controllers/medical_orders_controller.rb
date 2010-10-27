class MedicalOrdersController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_medical_order

  active_scaffold :medical_orders do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:name, :text]
  end

  def add_medical_order(record)
    @medical_order = MedicalOrder.find(params[:id])
    @view = 'add_medical_order'
  end
end
