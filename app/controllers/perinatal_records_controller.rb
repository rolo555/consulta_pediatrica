class PerinatalRecordsController < ApplicationController
  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :number_of_pregnancy, :childbirth, :cesarea, :abortions
    end
    action.columns.add_subgroup "" do |group|
      group.add :weight, :height, :head_circumference, :body_perimeter, :weeks_of_gestation, :apgar1, :apgar2
    end
    action.columns.add_subgroup "" do |group|
      group.add :type_of_birth, :jaundice, :observations
    end
  end

  active_scaffold :perinatal_record do |conf|
    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = :number_of_pregnancy, :weight, :height,
      :weeks_of_gestation, :type_of_birth

    #Quitar la acciones de search, create, delete
    conf.actions.exclude :search, :create, :delete

    #Configuracion de type_of_birth para que sea muestre en un select box
    conf.columns[:type_of_birth].form_ui = :select
    conf.columns[:type_of_birth].options = {:options => [:cesarea, :vaginal]}

    [:number_of_pregnancy, :childbirth, :cesarea, :abortions,
      :weeks_of_gestation, :apgar1, :apgar2, :height, :weight,
      :head_circumference, :body_perimeter].each do |field|
      conf.columns[field].options[:format] = nil
    end
    
    [:number_of_pregnancy, :childbirth, :cesarea, :abortions,
      :weeks_of_gestation, :apgar1, :apgar2].each do |field|
      conf.columns[field].form_ui = :select
    end

    conf.columns[:number_of_pregnancy].options = {:include_blank => true, :options => Array.new(10) {|i| i}}
    conf.columns[:childbirth].options = {:include_blank => true, :options => Array.new(11) {|i| i}}
    conf.columns[:abortions].options = {:include_blank => true, :options => Array.new(11) {|i| i}}
    conf.columns[:cesarea].options = {:include_blank => true, :options => Array.new(21) {|i| i}}
    conf.columns[:weeks_of_gestation].options = {:include_blank => true, :options => Array.new(51) {|i| i}}
    conf.columns[:apgar1].options = {:include_blank => true, :options => Array.new(51) {|i| i}}
    conf.columns[:apgar2].options = {:include_blank => true, :options => Array.new(21) {|i| i}}

    #Configuración de los agrupados por categorias para la acción create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end

  def before_update_save(record)
    value = params[:record][:weight].strip
    if value =~ /^[0-9]*\.?[0-9]+(\s\s*(gr|lb|kg))*$/
      record.weight = value.to_grams
    end
  end
end
