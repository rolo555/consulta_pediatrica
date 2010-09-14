module ModelHelper
  def clean_whitespaces(*args)
    args.each { |field| field.strip! if field.presence }
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