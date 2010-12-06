module VaccineSalesHelper

  def vaccine_sale_vaccines_name_column(record)
    record.vaccine.vaccines_name.to_label
  end

  def vaccine_sale_amount_form_column(record, options)
#    column = active_scaffold_config.columns[:amount]
#    options["disabled"] = "disabled"
#    active_scaffold_input_virtual(column, options)
    content_tag "span", record.amount, options
  end

end