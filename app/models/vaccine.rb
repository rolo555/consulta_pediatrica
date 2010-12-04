class Vaccine < ActiveRecord::Base
  #Relaciones
  belongs_to :vaccines_name

  #Validaciones
  validates_presence_of :vaccines_name, :purchase_cost, :percentage_increase, :units, :expiration_date
  validates_uniqueness_of :vaccines_name_id, :scope => [:expiration_date], :case_sensitive => false

  validates_numericality_of :units,
    :only_integer => true,
    :greater_than => 0

  validates_numericality_of :purchase_cost,
    :greater_than => 0

  validates_numericality_of :percentage_increase,
    :only_integer => true,
    :greater_than_or_equal_to => 0

  validate :expiration_date_cant_be_lower_than_today

  def to_label
    "#{vaccines_name} #{units} #{expiration_date}"
  end

  def expiration_date_cant_be_lower_than_today
    unless self.expiration_date.nil?
      if ( self.expiration_date <=> Date.today) <= 0
        errors.add :expiration_date, "#{as_('can\'t be lower than')} #{as_('today')}"
      end
    end
  end

end
