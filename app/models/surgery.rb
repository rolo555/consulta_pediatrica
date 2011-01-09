include ModelHelper

class Surgery < ActiveRecord::Base
  #Relaciones
  belongs_to :patient
  has_many :images, :as => :imaginable, :dependent => :destroy
  has_one :income, :as => :payment, :dependent => :destroy
  has_many :surgeries_surgical_staffs, :dependent => :destroy

  #Validaciones
  validates_presence_of :total_amount, :doctors_percentage,
    :surgeries_surgical_staffs
  validates_length_of :pre_operative_diagnosis, :maximum => 50,
    :unless => 'pre_operative_diagnosis.blank?'
  validates_length_of :post_operative_diagnosis, :maximum => 50,
    :unless => 'post_operative_diagnosis.blank?'

  validates_numericality_of :total_amount,
    :greater_than_or_equal_to => 0

  validates_numericality_of :hospital_amount,
    :greater_than_or_equal_to => 0

  validates_numericality_of :doctors_percentage,
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 100

  validate :hospital_amount_less_than_total_amount

  def hospital_amount_less_than_total_amount
    unless self.hospital_amount.blank? or self.total_amount.blank?
      if self.hospital_amount > self.total_amount
        errors.add :hospital_amount, "#{as_('can\'t be greater than')} #{as_('total_amount', :scope => [:activerecord, :attributes, :surgery])}"
      end
    end
  end

  def before_validation
    sanitizate_strings :pre_operative_diagnosis, :post_operative_diagnosis
  end

  def after_initialize
    if @new_record
      self.hospital_amount = 0 if self.hospital_amount.blank?
      self.total_amount = 0 if self.total_amount.blank?
      self.doctors_percentage = 56 if self.doctors_percentage.blank?
      self.surgeries_surgical_staffs = SurgicalStaff.find_all_by_is_always_present(true).map { |st| SurgeriesSurgicalStaff.new(:surgery => self, :surgical_staff => st) } if self.surgeries_surgical_staffs.blank?
    end
  end

  def after_create
    self.income = Income.new :created_at => self.created_at, :updated_at => self.updated_at
    self.income.save
  end

  def calculate_doctors_amount
    (self.total_amount - self.hospital_amount) * self.doctors_percentage / 100
  end

  def after_save
    self.income.concept = "Cirugia a #{patient.first_name} #{patient.last_name}"
    self.income.amount = calculate_doctors_amount
    self.income.save
  end

  def to_label
    "#{pre_operative_diagnosis}"
  end
end