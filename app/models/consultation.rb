class Consultation < ActiveRecord::Base
  #Relaciones
  belongs_to :patient
  has_many :images, :as => :imaginable
  has_many :surgery_quotations
  has_one :income, :as => :payment

  #Validaciones
  validates_numericality_of :weight,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :height,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :temperature,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :head_circumference,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :anterior_fontanel,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :amount,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true

  #FIXME: Consultation necesita método to_label

  def after_create
    self.income = Income.new :concept => "Consulta a #{patient.first_name} #{patient.last_name}",
      :amount => amount
    self.income.save
  end
end
