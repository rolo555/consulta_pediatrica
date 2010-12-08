class ApplicationRecord < ActiveRecord::Base

  belongs_to :immunization_record
  belongs_to :vaccine
  has_one :income, :as => :payment, :dependent => :destroy

  validates_presence_of :date, :application_type
  validates_presence_of :vaccine, :if => "self.doctor_application"
  validate :date_cant_be_greater_than_today
  validate :vaccine_must_be_nil_unless_doctor_application_is_selected

  def vaccine_must_be_nil_unless_doctor_application_is_selected
    unless self.vaccine.nil?
      unless( self.doctor_application )
        errors.add :vaccine, "#{as_('must be empty unless is a doctor application')}"
      end
    end
  end

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

  def after_create
    if self.doctor_application
      self.income = Income.new
      self.income.save
    end
  end

  def after_save
    if self.doctor_application
      self.income.concept = "Aplicacion de #{vaccine.vaccines_name.to_label} a #{self.immunization_record.patient.first_name} #{self.immunization_record.patient.last_name}"
      self.income.amount = self.vaccine.purchase_cost * (self.vaccine.percentage_increase / 100)
      self.income.save
      self.vaccine.units -= 1
      self.vaccine.save
    end
  end

  def destroy
    if self.doctor_application
      self.vaccine.units += 1
      self.vaccine.save
    end
    super
  end

end
