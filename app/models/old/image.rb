module Old
  class Image < OldDB
    #file_column :url
    belongs_to :consultation,
      :class_name => "Consultation",
      :foreign_key => "consultation_id"
    belongs_to :surgery,
      :class_name => "Surgery",
      :foreign_key => "surgery_id"
    set_table_name "images"
  end
end