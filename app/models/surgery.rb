include ModelHelper

class Surgery < ActiveRecord::Base

  #Relaciones
  belongs_to :patient
  has_many :images, :as => :imaginable

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

  def to_label
    "#{pre_operative_diagnosis}"
  end

end
