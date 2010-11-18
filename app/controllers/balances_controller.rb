class BalancesController < ApplicationController

  active_scaffold :balances do |conf|

    first_year = Income.first ? Income.minimum(:created_at).year : DateTime.now.year
    last_year = Income.first ? Income.maximum(:created_at).year : DateTime.now.year

    conf.columns = :date_start, :date_finish
    conf.columns[:date_start].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }
    conf.columns[:date_finish].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }

  end
    
end
