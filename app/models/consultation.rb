class Consultation < ActiveRecord::Base
  #Relaciones
  belongs_to :patient
end
