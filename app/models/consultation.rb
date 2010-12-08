class Consultation < ActiveRecord::Base
  #Relaciones
  belongs_to :patient
  has_many :images, :as => :imaginable
  has_many :surgery_quotations
  has_one :income, :as => :payment, :dependent => :destroy

  #Validaciones
  validates_numericality_of :weight,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :height,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :temperature,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :head_circumference,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :amount,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true

  def to_label
    "#{created_at.strftime("%d de %b %H:%M")} #{self.patient.first_name} #{self.patient.last_name} #{diagnosis} "
  end

  def after_create
    self.income = Income.new :created_at => self.created_at, :updated_at => self.updated_at
    self.income.save
  end

  def after_save
    self.income.concept = "Consulta a #{patient.first_name} #{patient.last_name}"
    self.income.amount = amount
    self.income.save
  end

  def set_amount
    self.amount = self.patient.amount unless self.patient.blank? 
  end

  def after_initialize
    set_amount if new_record?
  end
end
