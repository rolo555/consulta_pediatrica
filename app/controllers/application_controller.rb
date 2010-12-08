# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  ActiveScaffold.set_defaults do |conf|
    #Ignorar columnas de la fecha de creación y última actualización
    conf.ignore_columns.add [:created_at, :updated_at]

    #Mostrar 10 elementos al listar
    conf.list.per_page = 10

    #Utilizar search con ajax
    conf.search.live = true

    conf.action_links.add :help,
      :type => :collection,
      :page => true,
      :popup => true,
      :parameters => {:id => " "}
  end

  def help
    render :layout => "help"
  end

end
