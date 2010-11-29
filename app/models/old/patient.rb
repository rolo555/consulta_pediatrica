module Old
  class Patient < OldDB
    #file_column :photograph_url
    has_many   :consultations
    has_many   :vaccines, :dependent => :destroy
    has_many   :allergies
    has_many   :family_records
    has_many   :surgical_records
    has_many   :pathological_records
    has_many   :surgeries
    has_one   :perinatal_record,  :dependent => :destroy
 
    set_table_name "patients"
  end
end