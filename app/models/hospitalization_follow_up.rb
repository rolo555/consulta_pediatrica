include ModelHelper

class HospitalizationFollowUp < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  belongs_to :hospitalization

  #Validaciones
  validates_presence_of :date
  validates_length_of :room, :maximum => 50, :unless => "room.blank?"
  validate :date_must_be_lower_than_tomorrow


  def date_must_be_lower_than_tomorrow
    unless self.date.nil?
      if (self.date <=> Time.now) > 0
        errors.add :date, 'can\'t be greater than today'
      end
    end
  end

  def before_validation
    sanitizate_strings :room
  end

  def set_room
    self.room = self.hospitalization.room unless self.hospitalization.blank?
  end

  def change_room
    if self.room != self.hospitalization.room
      self.hospitalization.update_attribute(:room, self.room)
    end
  end

  def to_label
    "#{self.class.human_name} #{I18n.t(:created_at, :scope => :attributes).downcase} #{I18n.l date, :format => :short}"
  end

end
