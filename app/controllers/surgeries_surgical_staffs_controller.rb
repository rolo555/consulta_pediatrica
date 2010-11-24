class SurgeriesSurgicalStaffsController < ApplicationController
  active_scaffold :surgeries_surgical_staffs do |conf|
    conf.columns[:surgical_staff].form_ui = :record_select
  end
end
