class BalancesController < ApplicationController
  active_scaffold :balances do |conf|
    first_year = Income.minimum_year
    last_year = Income.maximum_year
    
    #Columnas que se mostraran
    conf.columns = :date_start, :date_finish

    #Iniciar date_start y date_finish en first_year hasta last_year
    conf.columns[:date_start].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }
    conf.columns[:date_finish].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }
  end

  def update
    do_update
    if self.successful?
      if params[:yearly]
        redirect_to :action => "yearly_balance"
      elsif params[:monthly]
        redirect_to :action => "monthly_balance"
      else
        redirect_to :action => "daily_balance"
      end
    else
      respond_to_action(:update)
    end
  end

  def yearly_balance
    @items = Income.yearly_balance
    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end

  def monthly_balance
    @items = Income.monthly_balance
    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end

  def daily_balance
    @items = Income.daily_balance
    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end
end
