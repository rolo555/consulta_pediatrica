class Balance < ActiveRecord::Base
  #Validaciones
  validates_presence_of :date_start, :date_finish
  validate :date_start_must_be_lower_than_date_finish
  validate :dates_must_be_lower_than_tomorrow

  def date_start_must_be_lower_than_date_finish
    unless self.date_start.nil? or self.date_finish.nil?
      if self.date_start > self.date_finish
        errors.add :date_start, "#{as_('can\'t be greater than')} #{as_('date_finish', :scope => 'activerecord.attributes.balance' )}"
      end
    end
  end

  def dates_must_be_lower_than_tomorrow
    unless self.date_start.nil? or self.date_finish.nil?
      if self.date_start > Date.today
        errors.add :date_start, "#{as_('can\'t be greater than')} #{as_('today')}"
      end
      if self.date_finish > Date.today
        errors.add :date_finish, "#{as_('can\'t be greater than')} #{as_('today')}"
      end
    end
  end
end
