class PerinatalRecordsController < ApplicationController
  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :number_of_pregnancy, :childbirth, :cesarea, :abortions, :weight
    end
    action.columns.add_subgroup "" do |group|
      group.add :height, :head_circumference, :body_perimeter, :weeks_of_gestation, :apgar1, :apgar2
    end
    action.columns.add_subgroup "" do |group|
      group.add :type_of_birth, :jaundice, :observations
    end
  end

  active_scaffold :perinatal_record do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = :number_of_pregnancy, :childbirth, :cesarea, :abortions,
      :weight, :height, :head_circumference, :body_perimeter,
      :weeks_of_gestation, :apgar1, :apgar2, :type_of_birth,
      :jaundice, :observations

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = :number_of_pregnancy, :weight, :height,
      :weeks_of_gestation, :type_of_birth

    #Quitar la acciones de search, create, delete
    conf.actions.exclude :search, :create, :delete

    #Configuración de los agrupados por categorias para la acción create
    add_sub_groups conf.update
    add_sub_groups conf.show

    #Configuracion de type_of_birth para que sea muestre en un select box
    conf.columns[:type_of_birth].form_ui = :select
    conf.columns[:type_of_birth].options = {:options => [:cesarea, :childbirth]}

    conf.columns[:weight].description = "By default <em>gr</em>, you can use <em>lb</em> and <em>kg</em>"
  end
end
