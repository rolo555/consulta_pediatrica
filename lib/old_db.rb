class OldDB < ActiveRecord::Base
  establish_connection :old_production
end
