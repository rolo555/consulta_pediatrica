# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'model_helper'
require 'test_helper'

class ModelHelperTest < ActiveSupport::TestCase
  context 'to_grams' do
    should 'convert from lb' do
      assert_equal "4989", "11 lb".to_grams
    end

    should 'convert from kg' do
      assert_equal "4000", "4 kg".to_grams
    end

    should 'convert from gr' do
      assert_equal "2345", "2345 gr".to_grams
    end
  end
end
