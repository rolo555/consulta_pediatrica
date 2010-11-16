include ModelHelper

class SurgicalStaff < ActiveRecord::Base

  has_and_belongs_to_many :surgeries

  validates_presence_of :staff, :percentage
  validates_numericality_of :percentage, :grater_than => 0, :less_than_or_equal_to => 100
  validates_length_of :staff, :maximum => 50, :if => "self.staff.presence"
  validates_uniqueness_of :staff, :case_sensitive => false

  def before_validation
    clean_whitespaces :staff
  end

  def to_label
    "#{staff} #{percentage}"
  end

end
