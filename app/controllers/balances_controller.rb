class BalancesController < ApplicationController
  active_scaffold :balances do |conf|
    first_year = Income.first ? Income.minimum(:created_at).year : DateTime.now.year
    last_year = Income.first ? Income.maximum(:created_at).year : DateTime.now.year

    conf.columns = :date_start, :date_finish
    conf.columns[:date_start].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }
    conf.columns[:date_finish].options = {:end_year => last_year, :start_year => first_year, :include_blank => true }
  end

  def update
    do_update
    if successful?
      if params[:yearly]
        redirect_to :action => "yearly_balance", :id => " "
      elsif params[:monthly]
        redirect_to :action => "monthly_balance", :id => " "
      elsif
        redirect_to :action => "daily_balance", :id => " "
      end
    else
      respond_to_action(:update)
    end
  end

  def yearly_balance
    balance = Balance.first
    start = balance.date_start
    finish = balance.date_finish
    @items = Income.yearly_balance(start.year, finish.year)
    respond_to do |format|
      format.pdf do
        render :pdf => "yearly_balance",
          :stylesheets => ["application","prince"],
          :layout => "pdf"
      end
    end
  end

  def monthly_balance
    balance = Balance.first
    start = balance.date_start
    finish = balance.date_finish
    @items = Income.monthly_balance(start.year, start.month, finish.year, finish.month)
    respond_to do |format|
      format.pdf do
        render :pdf => "monthly_balance",
          :stylesheets => ["application","prince"],
          :layout => "pdf"
      end
    end
  end

  def daily_balance
    balance = Balance.first
    start = balance.date_start
    finish = balance.date_finish
    @items = Income.daily_balance(start.to_date, finish.to_date)
    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end
end
