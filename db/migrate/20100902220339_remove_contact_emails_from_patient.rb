class RemoveContactEmailsFromPatient < ActiveRecord::Migration
  def self.up
    remove_column :patients, :contact_emails
  end

  def self.down
    add_column :patients, :contact_emails, :string
  end
end
