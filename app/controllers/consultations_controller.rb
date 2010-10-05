class ConsultationsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "" do |group|
      group.add :laboratory, :existing_laboratories
    end
  end

  active_scaffold :consultation do |conf|
    #Configuración de las columnas que se mostrarán 
    conf.columns = [:existing_laboratories, :weight, :height, :head_circumference, :anterior_fontanel, :temperature, :current_condition, :diagnosis, :medical_certificate, :recipe, :order, :laboratory, :amount]

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:created_at, :diagnosis, :recipe, :amount]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :patient

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]
    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end

  def default_values(consultation)
    patient = consultation.patient
    if patient.present?
      consultation.amount = patient.amount
    end
    consultation
  end

  def do_new
    @record = active_scaffold_config.model.new
    apply_constraints_to_record(@record)
    params[:eid] = @old_eid if @remove_eid
    @record = default_values(@record)
    @record
  end

end
