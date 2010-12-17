module VaccinesNamesHelper
  def vaccines_name_vaccine_schedules_show_column(record)
    list = record.vaccine_schedules.map { |item| content_tag "li", item.to_label }
    content_tag "ul", list.join(" ")
  end
end
