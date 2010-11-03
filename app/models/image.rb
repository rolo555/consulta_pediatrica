class Image < ActiveRecord::Base
  #Imagen
  has_attached_file :image,
    :styles => { :thumbnail => "100x100>" }
  #FIXME: Se tiene que poner default_url?
  #    :default_url => "missing.png"
  belongs_to :imaginable, :polymorphic => true
end
