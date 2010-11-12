class Income < ActiveRecord::Base
  #Relaciones
  belongs_to :payment, :polymorphic => true
end
