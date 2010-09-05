class Patient < ActiveRecord::Base
  #Relaciones
  has_many :emails, :dependent => :destroy
  has_many :consultations, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phone_numbers, :dependent => :destroy
  belongs_to :place

  #Fotografía
  has_attached_file :photograph, 
    :styles => { :thumb => "100x100>" },
    :default_url => "missing.png"

  def to_label
    "#{first_name} #{last_name}"
  end

  def age
    now = DateTime.now
    birth = self.date_of_birth.to_datetime
    days_since_birth = ( now - birth ).to_i
    date = Date.new(0,1,1) + days_since_birth
    years = date.year
    months = date.month - 1
    days = date.day - 1
    age = "#{years} años #{months} meses #{days} dias"
    age
  end

  validates_presence_of :first_name, :last_name, :date_of_birth  

end
