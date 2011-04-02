class Income < ActiveRecord::Base
  #Relaciones
  belongs_to :payment, :polymorphic => true

  #Validation
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :if => "self.amount.present?"

  def self.yearly_balance()
    start_date = Balance.first.date_start
    finish_date = Balance.first.date_finish
    balance = ActiveSupport::OrderedHash.new
    start_date.year.upto(finish_date.year).each do |year|
      balance[year] = {}
      start = DateTime.new(year, 1, 1)
      finish =  DateTime.new(year+1, 1, 1)
      balance[year]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
      balance[year]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
      balance[year]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish]
    end
    start = DateTime.new(start_date.year, 1, 1)
    finish =  DateTime.new(finish_date.year+1, 1, 1)
    balance["Subtotal"] = {}
    balance["Subtotal"]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
    balance["Subtotal"]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
    balance["Subtotal"]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish]
    balance
  end

  def self.monthly_balance()
    start_date = Balance.first.date_start
    finish_date = Balance.first.date_finish
    balance = ActiveSupport::OrderedHash.new
    start_date.year.upto(finish_date.year).each do |year|
      balance[year] = ActiveSupport::OrderedHash.new
      (year == start_date.year ? start_date.month : 1).upto(year == finish_date.year ? finish_date.month : 12).each do |month|
        balance[year][month] = ActiveSupport::OrderedHash.new
        start = DateTime.new(year, month, 1)
        finish =  start >> 1
        balance[year][month]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
        balance[year][month]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
        balance[year][month]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish]
      end
    end
    start = DateTime.new(start_date.year, start_date.month, 1)
    finish =  DateTime.new(finish_date.year, finish_date.month, 1) >> 1
    balance["-"] = {}
    balance["-"]["Subtotal"] = {}
    balance["-"]["Subtotal"]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
    balance["-"]["Subtotal"]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
    balance["-"]["Subtotal"]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish]
    balance
  end

  def self.daily_balance()
    start_date = Balance.first.date_start
    finish_date = Balance.first.date_finish
    balance = ActiveSupport::OrderedHash.new
    start_date.upto(finish_date) do |date|
      balance[date] = {}
      start = date
      finish = date+1
      balance[date]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
      balance[date]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start, finish], :group => :payment_type
      balance[date]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start, finish]
    end
    finish_date = finish_date + 1
    balance["Subtotal"] = {}
    balance["Subtotal"]["amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start_date, finish_date], :group => :payment_type
    balance["Subtotal"]["count"] = count :conditions => ["created_at >= ? AND created_at < ?", start_date, finish_date], :group => :payment_type
    balance["Subtotal"]["total_amount"] = sum :amount, :conditions => ["created_at >= ? AND created_at < ?", start_date, finish_date]
    balance
  end

  def to_label
    "#{self.concept}"
  end

  def self.minimum_year
    Income.first ? Income.minimum(:created_at).year : DateTime.now.year
  end

  def self.maximum_year
    Income.first ? Income.maximum(:created_at).year : DateTime.now.year
  end

end
