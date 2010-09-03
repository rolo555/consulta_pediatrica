# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100902232409) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", :force => true do |t|
    t.integer  "patient_id"
    t.float    "weight"
    t.float    "height"
    t.float    "head_circumference"
    t.float    "anterior_fontanel"
    t.float    "temperature"
    t.boolean  "deduct_clinic_percentage"
    t.text     "current_condition"
    t.text     "diagnosis"
    t.text     "medical_certificate"
    t.text     "recipe"
    t.text     "order"
    t.text     "laboratory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.date     "date_of_birth"
    t.string   "father"
    t.string   "mother"
    t.string   "origin"
    t.string   "referenced_by"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
