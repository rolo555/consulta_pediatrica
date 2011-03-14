class ApplicationRecord < ActiveRecord::Base

  belongs_to :immunization_record
  belongs_to :vaccine
  has_one :income, :as => :payment, :dependent => :destroy

  validates_presence_of :date, :application_type
  validates_presence_of :vaccine, :if => "self.doctor_application"
  validate :validate_date, :validate_vaccine

  def validate_vaccine
    if self.vaccine.present? and not self.doctor_application
      errors.add :vaccine, "#{as_('must be empty unless is a doctor application')}"
    end
  end

  def validate_date
    if self.date.present? and self.date > Date.today
      errors.add :date, "#{as_('can\'t be greater than')} #{as_('today')}"
    end
  end

  def to_label
    "#{application_type} #{as_ :of} #{I18n.l(date, :format => :long)}"
  end

  def update_income
    if self.income.present?
      self.income.concept = "#{as_ :application_of} #{vaccine.vaccines_name.to_label} #{as_ :to} #{self.immunization_record.patient.name}"
      self.income.amount = self.vaccine.calculate_profit
      self.income.save!
    end
  end

  def update_vaccine
    self.vaccine.sell if self.vaccine_id_changed? and self.vaccine_id_was.nil?
    if self.vaccine_id_changed? and self.vaccine_id_was.present?
      puts "update_vaccine\n\n"
      Vaccine.find(self.vaccine_id_was).refund
    end
  end

  def after_save
    self.income = Income.create! if self.doctor_application and self.income.blank?
#    if self.doctor_application and vaccine.present?
#      self.vaccine.sell
#    end
  end

  def destroy
    if self.doctor_application
      self.vaccine.units += 1
      self.vaccine.save
    end
    super
  end

end
