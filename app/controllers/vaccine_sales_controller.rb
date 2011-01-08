class VaccineSalesController < ApplicationController

  active_scaffold :vaccine_sale do |conf|
    conf.list.columns = :created_at, :buyer, :vaccines_name, :sales_units
    conf.columns[:vaccine].form_ui = :record_select
    conf.columns = [:vaccine, :sales_units, :buyer, :amount]
    conf.columns[:amount].options[:format] = :currency
    conf.columns[:amount].options[:i18n_options] = { :precision => 2 }
    conf.columns[:sales_units].update_column = :amount
    conf.columns[:sales_units].send_form_on_update_column = true
  end

  protected
  def after_render_field(record, column)
    if column.name == :sales_units and params[:record][:vaccine].present?
      vaccine = Vaccine.find(params[:record][:vaccine])
      unit_cost = ((vaccine.percentage_increase / 100) + 1) * vaccine.purchase_cost
      record.amount = record.sales_units * unit_cost
    else
      record.amount = 0
    end
  end
end
