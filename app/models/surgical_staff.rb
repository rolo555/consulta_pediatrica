include ModelHelper

class SurgicalStaff < ActiveRecord::Base
  has_and_belongs_to_many :surgeries

  validates_presence_of :staff
  validates_length_of :staff, :maximum => 50
  validates_uniqueness_of :staff, :case_sensitive => false

  def before_validation
    clean_whitespaces :staff
  end

  def to_label
    "#{staff}"
  end
end
