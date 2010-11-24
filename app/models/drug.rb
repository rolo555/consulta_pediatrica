include ModelHelper

class Drug < ActiveRecord::Base
  protected :before_validation

  validates_presence_of :name, :recipe
  validates_length_of :name, :maximum => 50, :if => "self.name.presence"
  validates_uniqueness_of :name
  validates_numericality_of :how_often_in_hours, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 24, :if => "self.how_often_in_hours.presence"
  validates_numericality_of :how_often_in_weight, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100,:if => "self.how_often_in_weight.presence"

  def before_validation
    sanitizate_strings :name
  end

  def to_label
    "#{name}"
  end
end
