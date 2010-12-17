class IncomesController < ApplicationController
  active_scaffold :income do |conf|
    conf.columns = :concept, :amount
    conf.list.columns = :created_at, :concept, :amount
    conf.show.columns = :created_at, :concept, :amount

    conf.action_links.add :balances,
      :type => :collection,
      :controller => "balances",
      :action => "edit",
      :parameters => { :id => Balance.first.nil? ? Balance.create().id : Balance.first.id },
      :page => true
  end
end
