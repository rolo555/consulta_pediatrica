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

ActiveRecord::Schema.define(:version => 20101123235913) do

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

  create_table "balances", :force => true do |t|
    t.date     "date_start"
    t.date     "date_finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultation_prices", :force => true do |t|
    t.string   "price_type"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default"
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

  create_table "diagnostics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.integer  "how_often_in_hours"
    t.integer  "how_often_in_weight"
    t.text     "recipe"
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

  create_table "hospital_expenses", :force => true do |t|
    t.string   "concept"
    t.integer  "price"
    t.boolean  "is_always_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imaginable_id"
    t.string   "imaginable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incomes", :force => true do |t|
    t.text     "concept"
    t.decimal  "amount"
    t.integer  "payment_id"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laboratory_profiles", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_certificates", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_orders", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathological_records", :force => true do |t|
    t.integer  "patient_id"
    t.date     "date"
    t.string   "diagnosis"
    t.string   "treatment"
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

  create_table "surgeries", :force => true do |t|
    t.string   "pre_operative_diagnosis"
    t.string   "post_operative_diagnosis"
    t.text     "procedure"
    t.text     "complications"
    t.integer  "total_amount"
    t.integer  "hospital_amount"
    t.float    "doctors_percentage"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surgeries_surgical_staffs", :force => true do |t|
    t.integer  "surgery_id"
    t.integer  "surgical_staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "surgery_quotations", :force => true do |t|
    t.integer  "days_of_hospitalization"
    t.string   "surgery_time"
    t.decimal  "medical_expenses"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surgery_surgical_staffs", :force => true do |t|
    t.integer  "surgery_id"
    t.integer  "surgical_staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surgical_records", :force => true do |t|
    t.integer  "patient_id"
    t.string   "pathology"
    t.text     "procedure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.date     "date"
  end

  create_table "surgical_staffs", :force => true do |t|
    t.string   "staff"
    t.boolean  "is_always_present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
