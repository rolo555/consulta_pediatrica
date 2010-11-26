class RemoveDeductClinicPercentageFromConsultation < ActiveRecord::Migration
  def self.up
    remove_column :consultations, :deduct_clinic_percentage
  end

  def self.down
    add_column :consultations, :deduct_clinic_percentage, :boolean
  end
end
