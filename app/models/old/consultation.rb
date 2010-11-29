module Old
  class Consultation < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    has_many :images
    has_many :surgery_quotations
    has_one :income, :dependent => :destroy
            
    set_table_name "consultations"
  end
end