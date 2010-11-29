module Old
class Image < OldDB
  file_column :url
  
  belongs_to :consultation,
    :class_name => "Consultation",
    :foreign_key => "consultation_id"
  
  belongs_to :surgery,
    :class_name => "Surgery",
    :foreign_key => "surgery_id"
  
  validates_presence_of :name, :url, :message => "no se puede dejar en blanco"
  
  def to_label
    "#{self.url}"
  end  
  
  def to_string
    "#{self.name}"
  end
  
  def table_name
    "images"
  end
     
  def search_field
    keywords = []
    keywords << self.name unless self.name.nil?
    keywords << self.description  unless self.description.nil?
    
    keywords.to_s
  end
  
end
end