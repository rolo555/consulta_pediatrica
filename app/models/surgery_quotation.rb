class SurgeryQuotation < ActiveRecord::Base
  #Relaciones
  belongs_to :consultation
  has_and_belongs_to_many :hospital_expenses

  validates_presence_of :days_of_hospitalization, :hospital_expenses,
    :medical_expenses, :surgery_time

  validates_numericality_of :days_of_hospitalization, :only_integer => true,
    :greater_than_or_equal_to => 0
  validates_numericality_of :medical_expenses, :greater_than_or_equal_to => 0
  validates_numericality_of :surgery_time, :greater_than_or_equal_to => 0

  def to_label
    "#{self.class.human_name} #{I18n.t(:created_at, :scope => :attributes).downcase} #{I18n.l created_at, :format => :short}"
  end

  def calculate_hospital_expense_price( hospital_expense )
    if hospital_expense.frequency == "por_hora"
      hour = self.surgery_time.to_i / 60
      hospital_expense.price * hour
    elsif hospital_expense.frequency == "por_dia"
      hospital_expense.price * self.days_of_hospitalization
    else
      hospital_expense.price
    end
  end

  def total_expenses
    medical_expenses + hospital_expenses.map { |e| calculate_hospital_expense_price e }.sum
  end

  def after_initialize
    self.hospital_expenses = HospitalExpense.find_all_by_is_always_used true if @new_record
  end
end