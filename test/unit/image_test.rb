require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  should belong_to :imaginable
  should validate_presence_of :image_file_name
end
