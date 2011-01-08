class VaccinesController < ApplicationController

  record_select :per_page => 5,
    :search_on => ['vaccines_name'],
    :full_text_search => true

  active_scaffold :vaccine do |conf|
    conf.list.columns = :vaccines_name, :units, :expiration_date
    conf.columns[:expiration_date].options = {:end_year => Date.today.year+15, :start_year => Date.today.year, :include_blank => false}
    conf.columns[:vaccines_name].form_ui = :record_select
    conf.columns = [:vaccines_name, :units, :expiration_date, :purchase_cost, :percentage_increase]
    conf.columns[:purchase_cost].options[:format] = :nil
    conf.columns[:percentage_increase].options[:format] = :percentage
    conf.columns[:percentage_increase].options[:i18n_options] = { :precision => 0 }
  end

  def index
    if params[:must_close]
      render :template => "close", :layout => false
    else
      list
    end
  end

end
