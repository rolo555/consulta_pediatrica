include ModelHelper

class HospitalExpense < ActiveRecord::Base
  validates_presence_of :concept, :price, :frequency
  validates_numericality_of :price, :only_integer => true, :greater_than_or_equal_to => 0
  validates_length_of :concept, :maximum => 50
  validates_uniqueness_of :concept, :case_sensitive => false

  has_and_belongs_to_many :surgery_quotations

  def before_validation
    clean_whitespaces :concept
  end

  def to_label
    "#{concept} #{price}"
  end
end
