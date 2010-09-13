class Patient < ActiveRecord::Base
  #Relaciones
  has_many :emails, :dependent => :destroy
  has_many :consultations, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phone_numbers, :dependent => :destroy
  belongs_to :place
  belongs_to :patient_price

  #Fotografía
  has_attached_file :photograph, 
    :styles => { :thumbnail => "100x100>" },
    :default_url => "missing.png"

  def to_label
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    birth = self.date_of_birth.to_datetime
    days_since_birth = ( now - birth ).to_i + 1
    date = Date.new(0) + days_since_birth
    years = date.year
    months = date.month - 1
    days = date.day - 1
    age = ""
    unless years.zero?
      age += "#{years} years "
    end
    unless months.zero?
      age += "#{months} months "
    end
    unless days.zero?
      age += "#{days} days"
    end
    age
  end

  validates_presence_of :first_name, :last_name, :date_of_birth
  validates_uniqueness_of :first_name, :scope => [:last_name, :date_of_birth], :case_sensitive => false

  def before_validation
    self.first_name.strip! if self.first_name.presence
    self.last_name.strip! if self.last_name.presence
    self.mother.strip! if self.mother.presence
    self.father.strip! if self.father.presence
    self.referenced_by.strip! if self.referenced_by.presence
  end

  def clone_patient
    twin = self.clone
    twin.first_name += " TWIN"
    twin.photograph = nil
    twin.created_at = DateTime.now
    twin.updated_at = DateTime.now
    twin
  end

  def amount
    if patient_price.present?
      amount = self.patient_price.amount
    end
    amount
  end
end
