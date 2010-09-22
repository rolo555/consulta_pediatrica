class PerinatalRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient
end
