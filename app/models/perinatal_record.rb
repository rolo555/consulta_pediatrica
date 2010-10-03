class PerinatalRecord < ActiveRecord::Base
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
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.weight.presence'
  validates_format_of :height,
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.height.presence'
  validates_format_of :head_circumference,
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.head_circumference.presence'
  validates_format_of :body_perimeter,
    :with => /^[0-9]*\.?[0-9]+$/,
    :message => 'is not a float positive number',
    :if => 'self.body_perimeter.presence'

  protected
  def before_validation
    clean_whitespaces self.number_of_pregnancy,
      self.childbirth,
      self.cesarea,
      self.abortions,
      self.weeks_of_gestation,
      self.apgar1,
      self.apgar2,
      self.weight,
      self.height,
      self.head_circumference,
      self.body_perimeter
  end
end
