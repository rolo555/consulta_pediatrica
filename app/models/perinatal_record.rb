include ModelHelper

class PerinatalRecord < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  belongs_to :patient

  [:number_of_pregnancy, :childbirth, :cesarea, :abortions, :weeks_of_gestation,
  :apgar1, :apgar2].each do |field|
    validates_numericality_of field, :only_integer => true,
      :greater_than => 0, :unless => "#{field}.blank?"
  end
  
  [:head_circumference, :body_perimeter, :weight, :height].each do |field|
    validates_numericality_of field, :greater_than => 0,
      :unless => "#{field}.blank?"
  end

#  validates_format_of :weight,
#    :with => /^[0-9]*\.?[0-9]+(\s*(gr|lb|kg))*$/,
#    :message => 'is not a float positive number or the unit is incorrect',
#    :if => 'self.weight.presence'
#  validates_format_of :height,
#    :with => /^[0-9]*\.?[0-9]+(\s*(cm|in))*$/,
#    :message => 'is not a float positive number or the unit is incorrect',
#    :if => 'self.height.presence'

  def before_validation
    sanitizate_strings :type_of_birth
  end

  #FIXME: PerinatalRecord necesita método to_label
end
