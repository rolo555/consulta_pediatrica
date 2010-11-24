module SurgicalRecordsHelper
  def surgical_record_date_form_column(record, options)
    day = ( record.day.blank? ? nil : record.day.to_i )
    month = ( record.month.blank? ? nil : record.month.to_i )
    year = ( record.year.blank? ? nil : record.year.to_i )

    dd = select_day(day, { :include_blank => true }, { :id => 'record_date_3i', :name => 'record[date(3i)]'})
    mm = select_month(month, { :include_blank => true }, { :id => 'record_date_2i', :name => 'record[date(2i)]'})
    yy = select_year(year, { :include_blank => true, :end_year => Date.today.year-30, :start_year => Date.today.year  }, { :id => 'record_date_1i', :name => 'record[date(1i)]'})
    #    puts "\n\n\n concatenacion => #{dd + mm + yy} \n\n\n"
    if record.errors[:date].blank?
      dd + mm + yy
    else
      "<div class=\"fieldWithErrors\">#{ dd + mm + yy }</div>"
    end
  end

  def surgical_record_aproximate_date_column(record)
    aproximate_date = []
    aproximate_date << "%d" unless record.day.blank?
    aproximate_date << as_(:abbr_month_names, :scope => [:date])[record.date.month] unless record.month.blank?
    aproximate_date << "%Y" unless record.year.blank?
    record.date.strftime aproximate_date.join(" ") unless record.date.blank?
    
  end

end
