include ModelHelper

class Hospitalization < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  belongs_to :patient
  has_many :doctors_name, :dependent => :destroy
  has_many :hospitalization_follow_up, :dependent => :destroy

  #Validaciones
  validates_presence_of :room
  validates_length_of :room, :maximum => 50, :unless => "room.blank?"

  def before_validation
    sanitizate_strings :room
  end

  def to_label
    "#{self.class.human_name} #{I18n.t(:created_at, :scope => :attributes).downcase} #{I18n.l created_at, :format => :short}"
  end

end
