class Reminder < ActiveRecord::Base
  #Relaciones
  belongs_to :reminder, :polymorphic => true
end
