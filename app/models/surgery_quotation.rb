class SurgeryQuotation < ActiveRecord::Base
  #Relaciones
  belongs_to :consultation
  has_and_belongs_to_many :hospital_expenses
end
