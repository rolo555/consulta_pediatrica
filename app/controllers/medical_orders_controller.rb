class MedicalOrdersController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_medical_order

  active_scaffold :medical_orders do |conf|
    conf.list.per_page = 10
    conf.search.live = true 
    conf.list.columns = [:name, :text]
    conf.columns.exclude :created_at, :updated_at
  end

  def add_medical_order(record)
    @medical_order = MedicalOrder.find(params[:id])
    @view = 'add_medical_order'
  end
end
