module Old
  class Surgery < OldDB
    has_one :income
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    has_many :images
    set_table_name "surgeries"
  end
end