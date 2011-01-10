class ImmunizationRecord < ActiveRecord::Base

  #Relaciones
  belongs_to :patient
  belongs_to :vaccines_name
  has_many :application_records, :dependent => :destroy

  #Validaciones
  validates_presence_of :vaccines_name
  validates_uniqueness_of :vaccines_name_id, :scope => :patient_id

  def to_label
    "#{self.class.human_name}"
  end

end
