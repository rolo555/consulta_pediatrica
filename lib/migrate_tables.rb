class MigrateTables

  def self.all
    start = Time.now
    self.consultation_price
    self.place
    self.laboratory_profile
    self.medical_certificate
    self.medical_order
    self.diagnostic
    self.patient
    self.phone_number
    self.address
    self.income
    self.consultation
    self.family_record
    self.pathological_record
    self.perinatal_record
    self.allergy
    self.hospital_expense
    self.surgery_quotation
    self.surgical_record
    #self.drug
    #self.email
    #self.image
    self.surgical_staff
    self.surgeries_surgical_staff
    self.surgery
    puts "All migrations done (#{Time.now - start})"
  end

  def self.consultation_price
    start = Time.now
    puts "Migrating consultation_price..."
    ConsultationPrice.delete_all
    ConsultationPrice.create! :price_type => "Normal", :amount => 150, :default => true
    puts "Migrating consultation_price OK (#{Time.now - start})"
  end

  def self.surgeries_surgical_staff
    start = Time.now
    puts "Deleting surgeries_surgical_staff..."
    SurgeriesSurgicalStaff.delete_all
    puts "Deleting surgeries_surgical_staff OK (#{Time.now - start})"
  end

  def self.income
    start = Time.now
    puts "Deleting income..."
    Income.delete_all
    puts "Deleting income OK (#{Time.now - start})"
  end

  def self.surgical_staff
    start = Time.now
    puts "Migrating surgical_staff..."
    SurgicalStaff.delete_all
    SurgicalStaff.create! :staff => "Cirujano/a", :is_always_present => true
    SurgicalStaff.create! :staff => "Asistente", :is_always_present => true
    SurgicalStaff.create! :staff => "Anestesiólogo/a", :is_always_present => true
    SurgicalStaff.create! :staff => "Instrumentalista", :is_always_present => true
    puts "Migrating surgical_staff OK (#{Time.now - start})"
  end

  def self.place
    start = Time.now
    puts "Migrating place..."
    Place.delete_all
    Place.create! :city => "?", :country => "?"
    puts "Migrating place OK (#{Time.now - start})"
  end

  def self.migrate(model, fields = [])
    fields = fields.concat ["search_field", "table_name", "to_string"]
    name = model.name.underscore
    start = Time.now
    puts "Migrating #{name}..."
    ActiveRecord::Base.transaction do
      model.delete_all
      olds = eval "Old::#{model}.all"
      olds.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          fields.include? key
        end
        attributes[:id] = old.id
        model.create! attributes
      end
    end
    puts "Migrating #{name} OK (#{Time.now - start})"
  end

  def self.laboratory_profile
    self.migrate LaboratoryProfile
  end

  def self.allergy
    self.migrate Allergy
  end

  def self.medical_certificate
    self.migrate MedicalCertificate
  end

  def self.medical_order
    self.migrate MedicalOrder
  end

  def self.patient
    start = Time.now
    place_text = I18n.t :place, :scope => [:activerecord, :attributes, :patient]
    default_price = ConsultationPrice.find_by_default(true)
    place = Place.first(true)
    puts "Migrating patient..."
    ActiveRecord::Base.transaction do
      Patient.delete_all
      olds = Old::Patient.all
      olds.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          ["search_field", "table_name", "to_string", "address",
            "photograph_url", "origin", "phone_number"].include? key
        end
        new = Patient.new attributes
        new.observations = "" if new.observations.blank?
        new.observations += "\r\n#{place_text}: #{old.origin}"
        new.consultation_price = default_price
        new.place = place
        new.id = old.id
        new.save!
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
          patient_id = old.id
          old.phone_number.split(/ /).delete_if { |phone| not is_a_number? phone }.map do |phone|
            PhoneNumber.create! :number => phone, :patient_id => patient_id
          end
        end
      end
    end
    puts "Migrating phone_number OK (#{Time.now - start})"
  end

  def self.address
    start = Time.now
    puts "Migrating address..."
    ActiveRecord::Base.transaction do
      Address.delete_all
      olds = Old::Patient.all
      olds.each do |old|
        patient_id = old.id
        Address.create!(:address => old.address, :patient_id => patient_id) unless old.address.blank?
      end
    end
    puts "Migrating address OK (#{Time.now - start})"
  end

  def self.consultation
    self.migrate Consultation, ["deduct_clinic_percentage"]
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
    start = Time.now
    puts "Cleaning pathological_record..."
    ActiveRecord::Base.transaction do
      Old::PathologicalRecord.all.each do |pr|
        pr.update_attributes! :date => Date.today if pr.date > Date.today
      end
    end
    puts "Cleaning pathological_record OK (#{Time.now - start})"
    self.migrate PathologicalRecord
  end

  def self.perinatal_record
    start = Time.now
    puts "Cleaning perinatal_record..."
    ActiveRecord::Base.transaction do
      Old::PerinatalRecord.find_all_by_height(0).each do |pr|
        pr.update_attributes! :height => nil
      end
    end
    ActiveRecord::Base.transaction do
      Old::PerinatalRecord.find_all_by_body_perimeter(0).each do |pr|
        pr.update_attributes! :body_perimeter => nil
      end
    end
    ActiveRecord::Base.transaction do
      Old::PerinatalRecord.find_all_by_head_circumference(0).each do |pr|
        pr.update_attributes! :head_circumference => nil
      end
    end
    ActiveRecord::Base.transaction do
      Old::PerinatalRecord.find_all_by_weight(0).each do |pr|
        pr.update_attributes! :weight => nil
      end
    end
    puts "Cleaning perinatal_record OK (#{Time.now - start})"
    self.migrate PerinatalRecord
  end

  def self.surgery_quotation
    self.migrate SurgeryQuotation
  end

  def self.hospital_expense
    fields = ["search_field", "table_name", "to_string"]
    name = HospitalExpense.name.underscore
    start = Time.now
    puts "Migrating #{name}..."
    ActiveRecord::Base.transaction do
      HospitalExpense.delete_all
      olds = Old::HospitalExpense.all
      olds.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          fields.include? key
        end
        attributes[:id] = old.id
        attributes[:price] = attributes[:price].to_i
        HospitalExpense.create! attributes
      end
    end
    puts "Migrating hospital_expense OK (#{Time.now - start})"
  end

  def self.surgical_record
    self.migrate SurgicalRecord
  end

  def self.surgery
    fields = ["search_field", "table_name", "to_string"]
    name = Surgery.name.underscore
    start = Time.now
    instrumentalist = SurgicalStaff.find_by_staff "Instrumentalista"
    surgeon = SurgicalStaff.find_by_staff "Cirujano/a"
    anesthesia_doctor = SurgicalStaff.find_by_staff "Anestesiologo/a"
    assistant = SurgicalStaff.find_by_staff "Asistente"
    puts "Migrating #{name}..."
    ActiveRecord::Base.transaction do
      Surgery.delete_all
      olds = Old::Surgery.all
      olds.each do |old|
        attributes = old.attributes
        attributes.delete_if do |key, |
          fields.include? key
        end
        attributes[:total_amount] = old.total_amount.to_f
        attributes[:hospital_amount] = old.hospital_amount.to_f
        attributes[:id] = old.id
        if old.instrumentalist =~ /Ismael/
          attributes[:doctors_percentage] = old.instrumentalist_amount / old.total_amount * 100
        end
        surgeries_surgical_staffs = []
        surgeries_surgical_staffs << SurgeriesSurgicalStaff.new(:name => old.instrumentalist, :surgical_staff => instrumentalist, :surgery_id => old.id)
        attributes.delete "instrumentalist_amount"
        attributes.delete "instrumentalist"
        if old.surgeon=~ /Ismael/
          attributes[:doctors_percentage] = old.total_amount == 0 ? 0 : old.surgeon_amount / old.total_amount * 100
        end
        surgeries_surgical_staffs << SurgeriesSurgicalStaff.new(:name => old.surgeon, :surgical_staff => surgeon, :surgery_id => old.id)
        attributes.delete "surgeon_amount"
        attributes.delete "surgeon"
        if old.assistant=~ /Ismael/
          attributes[:doctors_percentage] = old.total_amount == 0 ? 0 : old.assistant_amount / old.total_amount * 100
        end
        surgeries_surgical_staffs << SurgeriesSurgicalStaff.new(:name => old.assistant, :surgical_staff => assistant, :surgery_id => old.id)
        attributes.delete "assistant_amount"
        attributes.delete "assistant"
        if old.anesthesia_doctor=~ /Ismael/
          attributes[:doctors_percentage] = old.total_amount == 0 ? 0 : old.anesthesia_doctor_amount / old.total_amount * 100
        end
        surgeries_surgical_staffs << SurgeriesSurgicalStaff.new(:name => old.anesthesia_doctor, :surgical_staff => anesthesia_doctor, :surgery_id => old.id)
        attributes.delete "anesthesia_doctor_amount"
        attributes.delete "anesthesia_doctor"
        surgery = Surgery.new attributes
        surgery.surgeries_surgical_staffs = surgeries_surgical_staffs
        surgery.save(false)
      end
    end
    puts "Migrating surgery OK (#{Time.now - start})"
  end

  def self.is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
end
