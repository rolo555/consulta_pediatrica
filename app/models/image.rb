class Image < ActiveRecord::Base
  #Imagen
  has_attached_file :image,
    :styles => { :thumbnail => "100x100>" }
  #FIXME: Se tiene que poner default_url?
  #    :default_url => "missing.png"
  
  #Relacones
  belongs_to :imaginable, :polymorphic => true

  #Validaciones
  #FIXME: No esta funcionando la validación
  validates_presence_of :image_file_name
end
