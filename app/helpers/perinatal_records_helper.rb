module PerinatalRecordsHelper
  def perinatal_record_weight_column(record)
    unless record.weight.blank?
      "#{record.weight} #{I18n.t :grams, :scope => [:number, :weight]}"
    else
      "-"
    end
  end

  def perinatal_record_height_column(record)
    unless record.height.blank?
      "#{record.height} #{I18n.t :centimeters, :scope => [:number, :height]}"
    else
      "-"
    end
  end

  def perinatal_record_head_circumference_column(record)
    unless record.head_circumference.blank?
    "#{record.head_circumference} #{I18n.t :grams, :scope => [:number, :weight]}"
    else
      "-"
    end
  end

  def perinatal_record_body_perimeter_column(record)
    unless record.head_circumference.blank?
      "#{record.body_perimeter} #{I18n.t :centimeters, :scope => [:number, :height]}" unless record.body_perimeter.blank?
    else
      "-"
    end
  end
end
