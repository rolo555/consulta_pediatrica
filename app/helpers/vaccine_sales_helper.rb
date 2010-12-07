module VaccineSalesHelper

  def vaccine_sale_vaccines_name_column(record)
    record.vaccine.vaccines_name.to_label
  end

  def vaccine_sale_amount_form_column(record, options)
    content_tag "span", record.amount, options
  end

end