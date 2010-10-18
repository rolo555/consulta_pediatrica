include ModelHelper

class HospitalExpense < ActiveRecord::Base
  validates_presence_of :concept, :price
  validates_numericality_of :price, :only_integer => true, :greater_than => 0
  validates_length_of :concept, :maximum => 50, :if => "self.concept.presence"
  validates_uniqueness_of :concept, :case_sensitive => false

  def before_validation
    clean_whitespaces :concept
  end

  def to_label
    "#{concept} #{price}"
  end
end
