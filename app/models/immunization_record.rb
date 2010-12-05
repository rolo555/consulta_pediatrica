class ImmunizationRecord < ActiveRecord::Base

  #Relaciones
  belongs_to :patient
  belongs_to :vaccines_name
  has_many :application_records, :dependent => :destroy

  #Validaciones
  validates_presence_of :vaccines_name, :application_records

  def to_label
    "#{self.class.human_name}"
  end

end
