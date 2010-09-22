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

ActiveRecord::Schema.define(:version => 20100922012627) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allergies", :force => true do |t|
    t.string   "substance"
    t.string   "reaction"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultation_prices", :force => true do |t|
    t.string   "price_type"
    t.decimal  "amount"
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
    t.decimal  "amount"
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

  create_table "family_records", :force => true do |t|
    t.string   "pathology"
    t.string   "relation_ship"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "father"
    t.string   "mother"
    t.string   "referenced_by"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.integer  "place_id"
    t.integer  "consultation_price_id"
  end

  create_table "perinatal_records", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "number_of_pregnancy"
    t.integer  "childbirth"
    t.integer  "cesarea"
    t.integer  "abortions"
    t.float    "weight"
    t.float    "height"
    t.float    "head_circumference"
    t.float    "body_perimeter"
    t.integer  "weeks_of_gestation"
    t.integer  "apgar1"
    t.integer  "apgar2"
    t.string   "type_of_birth"
    t.boolean  "jaundice"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "number"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
