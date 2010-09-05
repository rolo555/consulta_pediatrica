class Place < ActiveRecord::Base
  has_many :patients
  validates_presence_of :city, :country
  validates_uniqueness_of :city,
    :scope => [:country],
    :message => " and Country already exist"

  def to_label
    "#{city} #{country}"
  end
  
end
