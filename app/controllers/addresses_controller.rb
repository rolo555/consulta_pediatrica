class AddressesController < ApplicationController
  active_scaffold :address do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:address]

    conf.action_links.delete :help
  end
end
