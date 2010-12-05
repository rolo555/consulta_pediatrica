class ApplicationRecord < ActiveRecord::Base

  belongs_to :immunization_record

  validates_presence_of :date, :application_type
  validate :date_cant_be_greater_than_today

  def date_cant_be_greater_than_today
    unless self.date.nil?
      if (self.date <=> Date.today) > 0
        errors.add :date, "#{as_('can\'t be greater than')} #{as_('today')}"
      end
    end
  end

  def to_label
    month =  as_(:month_names, :scope => [:date])[date.month] unless date.month.blank?
    "#{application_type} del #{date.day} de #{month} del #{date.year}"
  end

end
