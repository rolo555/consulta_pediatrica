class MigrateTables

  def self.all
    start = Time.now
    self.laboratory_profile
    self.medical_certificate
    self.medical_order
    self.patient
    self.phone_number
    self.consultation
    self.diagnostic
    self.family_record
    self.pathological_record
    self.perinatal_record
    self.surgery_quotation
    puts "All migrations done (#{Time.now - start})"
  end

  def self.migrate(model)
    name = model.name.underscore
    start = Time.now
    puts "Migrating #{name}..."
    ActiveRecord::Base.transaction do
      model.delete_all
      olds = eval "Old::#{model}.all"
      olds.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          ["search_field", "table_name", "to_string"].include? key
        end
        new = model.new attributes
        new.id = old.id
        new.save(false)
      end
    end
    puts "Migrating #{name} OK (#{Time.now - start})"
  end

  def self.laboratory_profile
    self.migrate LaboratoryProfile
  end

  def self.medical_certificate
    self.migrate MedicalCertificate
  end

  def self.medical_order
    self.migrate MedicalOrder
  end

  def self.patient
    start = Time.now
    place = I18n.t :place, :scope => [:activerecord, :attributes, :patient]
    puts "Migrating patient..."
    ActiveRecord::Base.transaction do
      Patient.delete_all
      olds = Old::Patient.all
      olds.each do |old|
        attributes = old.attributes
        attributes[:addresses] = [Address.new(:address => attributes[:address])]
        attributes.delete_if do |key, |
          ["search_field", "table_name", "to_string", "address",
            "photograph_url", "origin", "phone_number"].include? key
        end
        new = Patient.new attributes
        new.observations = "" if new.observations.blank?
        new.observations += "\r\n#{place}: #{old.origin}"
        new.id = old.id
        new.save(false)
      end
    end
    puts "Migrating patient OK (#{Time.now - start})"
  end

  def self.phone_number
    start = Time.now
    puts "Migrating phone_number..."
    ActiveRecord::Base.transaction do
      PhoneNumber.delete_all
      olds = Old::Patient.all
      olds.each do |old|
        unless old.phone_number.blank?
          phone_numbers = old.phone_number.split(/ /).delete_if { |phone| not is_a_number? phone }.map {|phone| PhoneNumber.new :number => phone}
          new = Patient.find old.id
          new.phone_numbers = phone_numbers
          new.save(false)
        end
      end
    end
    puts "Migrating phone_number OK (#{Time.now - start})"
  end

  def self.consultation
    start = Time.now
    puts "Migrating consultation..."
    ActiveRecord::Base.transaction do
      Consultation.delete_all
      Old::Consultation.all.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          ["search_field", "table_name", "to_string", "deduct_clinic_percentage"].include? key
        end
        new = Consultation.new attributes
        new.id = old.id
        new.save(false)
      end
    end
    puts "Migrating consultation OK (#{Time.now - start})"
  end

  def self.allergy
    self.migrate Allergy
  end

  def self.diagnostic
    self.migrate Diagnostic
  end

  def self.family_record
    self.migrate FamilyRecord
  end

  def self.pathological_record
    self.migrate PathologicalRecord
  end

  def self.perinatal_record
    self.migrate PerinatalRecord
  end

  def self.surgery_quotation
    self.migrate SurgeryQuotation
  end

  def self.is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
end
