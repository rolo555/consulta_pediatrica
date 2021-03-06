ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'mocha'

class ActiveSupport::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sanitizate(f)
  fixture = self.class.name.gsub!("Test", "").underscore.pluralize
  eval(
    "
    def sanitizate_#{f}
      record = #{fixture}(:spaces)
      record.valid?
      actual = record.instance_eval('#{f}')
      assert(actual.eql?(actual.strip), 'The field {#{f} = ' + actual + ' } have whitespaces')
    end
    "
  )
  eval("sanitizate_#{f}")
end

def should_be_positive_number(field)
  should allow_value('').for(field)
  should allow_value(nil).for(field)
  should_not allow_value('abcd').for(field)
  should_not allow_value('-1').for(field)
end

def should_be_positive_integer_non_zero(field)
  should_not allow_value('0').for(field)
  should_be_positive_integer field
end
  
def should_be_positive_integer(field)
  should_not allow_value('0.5').for(field)
  should_be_positive_number field
end

def should_be_positive_float(field)
  should allow_value('0.5').for(field)
  should_be_positive_number field
end

def valid_method_should_call_clean_whitespaces_of_all_strings(klass, exclude_fields = [])
  context 'valid? method' do
    should 'call clean_whitespaces of all strings' do
      object = klass.new
      (object.string_attributes - exclude_fields).each do |attr|
        object.expects(:clean_whitespaces).with(attr)
      end
      object.valid?
    end
  end
end