include ModelHelper

class PerinatalRecord < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_format_of :number_of_pregnancy,
    :with => /^[1-9][0-9]*$/,
    :message => 'is not an integer positive number',
    :if => 'self.number_of_pregnancy.presence'
  validates_format_of :childbirth,
    :with => /^\d+$/,
    :message => 'is not an integer positive number',
    :if => 'self.childbirth.presence'
  validates_format_of :cesarea,
    :with => /^\d+$/,
    :message => 'is not an integer positive number',
    :if => 'self.cesarea.presence'
  validates_format_of :abortions,
    :with => /^[1-9][0-9]*$/,
    :message => 'is not an integer positive number',
    :if => 'self.abortions.presence'
  validates_format_of :weeks_of_gestation,
    :with => /^[1-9][0-9]*$/,
    :message => 'is not an integer positive number',
    :if => 'self.weeks_of_gestation.presence'
  validates_format_of :apgar1,
    :with => /^[1-9][0-9]*$/,
    :message => 'is not an integer positive number',
    :if => 'self.apgar1.presence'
  validates_format_of :apgar2,
    :with => /^[1-9][0-9]*$/,
    :message => 'is not an integer positive number',
    :if => 'self.apgar2.presence'
  validates_format_of :weight,
    :with => /^[0-9]*\.?[0-9]+(\s*(gr|lb|kg))*$/,
    :message => 'is not a float positive number or the unit is incorrect',
    :if => 'self.weight.presence'
  validates_format_of :height,
    :with => /^[0-9]*\.?[0-9]+(\s*(cm|in))*$/,
    :message => 'is not a float positive number or the unit is incorrect',
    :if => 'self.height.presence'
  validates_format_of :head_circumference,
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.head_circumference.presence'
  validates_format_of :body_perimeter,
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.body_perimeter.presence'

  def before_validation
    sanitizate_strings :number_of_pregnancy,
      :childbirth,
      :cesarea,
      :abortions,
      :weeks_of_gestation,
      :apgar1,
      :apgar2,
      :weight,
      :height,
      :head_circumference,
      :body_perimeter,
      :type_of_birth
  end

  def after_save
    self.weight = self.weight.to_grams if !self.weight.nil?
    self.height = self.height.to_cms if !self.height.nil?
  end

  #FIXME: PerinatalRecord necesita método to_label
end
