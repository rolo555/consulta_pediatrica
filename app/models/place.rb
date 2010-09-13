class Place < ActiveRecord::Base
  has_many :patients
  validates_presence_of :city, :country
  validates_uniqueness_of :city,
    :scope => [:country],
#    :message => " and Country already exist",
    :case_sensitive => false

  def to_label
    "#{city} #{country}"
  end

  def before_validation
    self.city.strip! if self.city.presence
    self.country.strip! if self.country.presence
  end
  
end
