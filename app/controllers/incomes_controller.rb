class IncomesController < ApplicationController
  active_scaffold :income do |conf|
    conf.columns = :concept, :amount
    conf.list.columns = :created_at, :concept, :amount
    conf.show.columns = :created_at, :concept, :amount

    conf.action_links.add :daily_balance,
      :type => :collection,
      :controller => "balances",
      :action => "new"
  end

  def daily_balance
#    if params[:record]
#      @consultation = Consultation.find params[:id]
#      respond_to do |format|
#        format.pdf do
#          render :pdf => "print",
#            :stylesheets => ["application","prince"],
#            :layout => "pdf"
#        end
#      end
#    else
#      @record = Consultation.find params[:id]
#      render :layout => false
#    end
  end

end
