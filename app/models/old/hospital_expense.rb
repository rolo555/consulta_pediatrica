module Old
  class HospitalExpense < OldDB
    has_and_belongs_to_many :surgery_quotations
    # :class_name => "HospitalExpense",
    # :join_table => "hospital_expenses_surgery_quotations",
    #:foreign_key => "hospital_expense_id",
    # :association_foreign_key => "surgery_quotation_id"
  
    set_table_name "hospital_expenses"
  end
end