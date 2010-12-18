class VaccineSchedule < ActiveRecord::Base
  validates_presence_of :vaccines_name, :application_type, :days
  belongs_to :vaccines_name

  def number
    index = VaccineSchedule.find_all_by_vaccines_name_id_and_application_type(vaccines_name.id,
      application_type, :order => :days).index self
    if application_type.downcase == "dosis"
      type = :dosis
    else
      type = :refuerzos
    end
    if index.nil?
      '?'
    else
      as_(type)[index+1]
    end
  end

  def to_label
    "#{number} #{application_type}, #{days} días"
  end
end
