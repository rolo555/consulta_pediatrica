include ModelHelper

class VaccineSale < ActiveRecord::Base
  #Relaciones
  belongs_to :vaccine
  has_one :income, :as => :payment, :dependent => :destroy

  #Validaciones
  validates_presence_of :buyer, :sales_units, :amount, :vaccine
  validates_length_of :buyer, :maximum => 50, :unless => "buyer.blank?"
  validates_numericality_of :sales_units,
    :greater_than => 0,
    :only_integer => true
  validates_numericality_of :amount,
    :greater_than_or_equal_to => 0
  validate :sales_units_cant_be_greater_than_vaccine_units

  def sales_units_cant_be_greater_than_vaccine_units
    unless sales_units.blank? or vaccine.blank?
      if (sales_units > vaccine.units)
        errors.add :sales_units, "#{as_('can\'t be greater than')} #{as_('vaccines units')}"
      end
    end
  end



  def before_validation
    sanitizate_strings :buyer
  end

  def before_save
    if self.new_record?
      old_units = 0
    else
      old_units = VaccineSale.find(self.id).sales_units
    end
    @diff_units = old_units - self.sales_units
  end

  def after_create
    self.income = Income.new
    self.income.save
    self.vaccine.units = self.vaccine.units - self.sales_units
    self.vaccine.save
  end

  def after_update
    self.vaccine.units = self.vaccine.units + @diff_units
    self.vaccine.save
  end

  def after_save
    self.income.concept = "Venta a #{buyer} de #{sales_units} unidades de #{vaccine.vaccines_name.to_label}"
    self.income.amount = (vaccine.purchase_cost * (vaccine.percentage_increase / 100)) * sales_units
    self.income.save
  end

  def to_label
    "#{self.class.human_name} de #{buyer}"
  end

end
