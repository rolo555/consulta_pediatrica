class Vaccine < ActiveRecord::Base
  #Relaciones
  belongs_to :vaccines_name
  has_many :vaccine_sale
  has_many :application_record

  #Validaciones
  validates_presence_of :vaccines_name, :purchase_cost, :percentage_increase, :units, :expiration_date
  validates_uniqueness_of :vaccines_name_id, :scope => [:expiration_date], :case_sensitive => false

  validates_numericality_of :units,
    :only_integer => true,
    :greater_than => 0

  validates_numericality_of :purchase_cost,
    :greater_than => 0

  validates_numericality_of :percentage_increase,
    :greater_than_or_equal_to => 0

  validate :expiration_date_cant_be_lower_than_today

  def to_label
    "#{vaccines_name.to_label}, #{units}, #{expiration_date}"
  end

  def expiration_date_cant_be_lower_than_today
    unless self.expiration_date.nil?
      if ( self.expiration_date <=> Date.today) <= 0
        errors.add :expiration_date, "#{as_('can\'t be lower than')} #{as_('today')}"
      end
    end
  end

  def calculate_profit
    purchase_cost * (percentage_increase / 100)
  end

  def sell
    self.units -= 1
    self.save!
  end

  def refund
    puts "refund\n\n"
    self.units += 1
    self.save!
  end

end
