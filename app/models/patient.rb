class Patient < ActiveRecord::Base
  #Relaciones
  has_many :emails, :dependent => :destroy
  has_many :consultations, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phone_numbers, :dependent => :destroy
  belongs_to :place

  #Fotografía
  has_attached_file :photograph, :styles => { :thumb => "100x100>" }

  def to_label
    "#{first_name} #{last_name}"
  end
  validates_presence_of :first_name, :last_name, :date_of_birth  

end
