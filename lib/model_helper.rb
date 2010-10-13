module ModelHelper

  def sanitizate_strings(*args)
    args.each { |field| clean_whitespaces(field) }
  end

  def clean_whitespaces(field)
    send(field).strip! if send(field).presence
  end

  def string_attributes
    self.class.columns.delete_if {|c| c.type != :string }.map {|c| c.name.to_sym }
  end
end

class Date
  def diff(date)
    years, months, days = 0, 0, 0
    while (date >> 12) < self
      years += 1
      date >>= 12
    end
    while (date >> 1) < self
      months += 1
      date >>= 1
    end
    while (date + 1) < self
      days += 1
      date += 1
    end
    return years, months, days
  end
end

class String
  def to_grams
    quantity, unit = self.split
    return quantity if unit.nil?
    return case unit
    when 'lb'
      (453.59237 * quantity.to_f).round.to_s
    when 'kg'
      (1000 * quantity.to_f).round.to_s
    when 'gr'
      quantity.to_f.round.to_s
    end
  end

  def to_cms
    quantity, unit = self.split
    return quantity if unit.nil?
    return case unit
    when 'in'
      (2.54 * quantity.to_f).round.to_s
    when 'cm'
      quantity.to_f.round.to_s
    end
  end
end