class Balance < ActiveRecord::Base

  validates_presence_of :date_start, :date_finish
  validate :date_start_must_be_lower_than_date_finish
  validate :dates_must_be_lower_than_tomorrow

  def date_start_must_be_lower_than_date_finish
    unless self.date_start.nil? or self.date_finish.nil?
      if (self.date_start <=> self.date_finish ) > 0
        errors.add :date_start, 'can\'t be greater than date finish'
      end
    end
  end

  def dates_must_be_lower_than_tomorrow
    unless self.date_start.nil? or self.date_finish.nil?
      if (self.date_start <=> Date.today ) > 0
        errors.add :date_start, 'can\'t be greater than today'
      end
      if (self.date_finish <=> Date.today ) > 0
        errors.add :date_finish, 'can\'t be greater than today'
      end
    end
  end

end
