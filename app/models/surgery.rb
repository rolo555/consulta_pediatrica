include ModelHelper

class Surgery < ActiveRecord::Base

  #Relaciones
  belongs_to :patient
  has_many :images, :as => :imaginable
  has_one :income, :as => :payment
  has_and_belongs_to_many :surgical_staffs

  #Validaciones
  validates_presence_of :sugeon, :anesthesia_doctor, :total_amount
  validates_length_of :sugeon, :maximum => 50, :if => "self.sugeon.presence"
  validates_length_of :pre_operative_diagnosis, :maximum => 50, :if => "self.pre_operative_diagnosis.presence"
  validates_length_of :post_operative_diagnosis, :maximum => 50, :if => "self.post_operative_diagnosis.presence"
  validates_length_of :assistant, :maximum => 50, :if => "self.assistant.presence"
  validates_length_of :anesthesia_doctor, :maximum => 50, :if => "self.anesthesia_doctor.presence"

  validates_numericality_of :total_amount,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :if => "self.total_amount.presence"

  validates_numericality_of :hospital_amount,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :if => "self.hospital_amount.presence"

  def before_validation
    sanitizate_strings :pre_operative_diagnosis, :post_operative_diagnosis, :sugeon, :assistant, :anesthesia_doctor
  end

  def before_create
    self.income = Income.new
    self.income.save
  end

  def after_save
     self.income.concept = "Cirugia a #{patient.first_name} #{patient.last_name}"
     self.income.amount = total_amount
     self.income.save
  end

  def to_label
    "#{pre_operative_diagnosis}"
  end

end
