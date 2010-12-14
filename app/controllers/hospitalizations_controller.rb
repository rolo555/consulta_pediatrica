class HospitalizationsController < ApplicationController
  active_scaffold :hospitalization do |conf|
    conf.list.columns = :created_at, :doctors_names, :room, :hospitalization_follow_up
    conf.columns.exclude :hospitalization_follow_up
    #Link a imprimir
    conf.action_links.add :print,
      :type => :member,
      :page => true
  end

  def print
    respond_to do |format|
      format.pdf do
        render :pdf => "print",
          :stylesheets => ["application","prince"],
          :layout => "pdf"
      end
    end
  end
end
