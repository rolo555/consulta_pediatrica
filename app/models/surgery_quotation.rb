class SurgeryQuotation < ActiveRecord::Base
  #Relaciones
  belongs_to :consultation
  has_and_belongs_to_many :hospital_expenses

  validates_presence_of :days_of_hospitalization
  validates_presence_of :hospital_expenses
  validates_presence_of :medical_expenses
  validates_presence_of :surgery_time

  validates_numericality_of :days_of_hospitalization, :only_integer => true, :greater_than => 0
  validates_numericality_of :medical_expenses, :greater_than => 0
  validates_numericality_of :surgery_time, :greater_than => 0

  def to_label
    total_expenses
  end

  def total_expenses
    medical_expenses + hospital_expenses.map { |e| e.price }.sum
  end

  def initialize
    super()
    if (@new_record)
      self.hospital_expenses = HospitalExpense.find_all_by_is_always_used true
    end
  end
end