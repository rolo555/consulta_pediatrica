class VaccinesController < ApplicationController

  active_scaffold :vaccine do |conf|
    conf.list.columns = :vaccines_name, :units, :expiration_date
    conf.columns[:expiration_date].options = {:end_year => Date.today.year+15, :start_year => Date.today.year, :include_blank => false}
    conf.columns[:vaccines_name].form_ui = :record_select
    conf.columns = [:vaccines_name, :units, :expiration_date, :purchase_cost, :percentage_increase]
    conf.columns[:purchase_cost].options[:format] = :currency
    conf.columns[:purchase_cost].options[:i18n_options] = { :precision => 2 }
    conf.columns[:percentage_increase].options[:format] = :percentage
    conf.columns[:percentage_increase].options[:i18n_options] = { :precision => 0 }
  end

end
