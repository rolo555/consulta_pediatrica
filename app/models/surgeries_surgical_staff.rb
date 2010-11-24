class SurgeriesSurgicalStaff < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :surgical_staff

  validates_presence_of :surgery, :surgical_staff, :name
end
