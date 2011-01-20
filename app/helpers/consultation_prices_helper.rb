module ConsultationPricesHelper
  def consultation_price_default_form_column(record, options)
    options["onchange"] = remote_function(:update => "as_consultation_prices-messages", :url => { :action => "warning_message" }, :with => "'selected=' + this.checked")
    column = active_scaffold_config.columns[:default]
    active_scaffold_input_checkbox(column, options)
  end
end
