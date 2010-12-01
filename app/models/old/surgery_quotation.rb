module Old
  class SurgeryQuotation < OldDB
    belongs_to :consultation,
      :class_name => "Consultation",
      :foreign_key => "consultation_id"
    has_and_belongs_to_many :hospital_expenses
    #:class_name => "SurgeryQuotation",
    #:join_table => "hospital_expenses_surgery_quotations",
    #:foreign_key => "surgery_quotation_id",
    #:association_foreign_key => "hospital_expense_id"
    set_table_name "surgery_quotations"
  end
end