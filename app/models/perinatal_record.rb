class PerinatalRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_numericality_of :number_of_pregnancy, 
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :childbirth,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :cesarea,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :abortions,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :weeks_of_gestation,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :apgar1,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :apgar2,
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :weight,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :height,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :head_circumference,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
  validates_numericality_of :body_perimeter,
    :greater_than_or_equal_to => 0,
    :allow_nil => true
end
