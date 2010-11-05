class ConsultationsController < ApplicationController
  active_scaffold :consultation do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:weight, :height, :head_circumference, :anterior_fontanel,
      :temperature, :current_condition, :diagnosis, :medical_certificate, 
      :recipe, :order, :laboratory, :amount]

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:diagnosis, :recipe, :amount, :images,
      :surgery_quotations]

    #Configuración de cómo se mostrará la columna amount
    conf.columns[:amount].options[:format] = :currency
    conf.columns[:amount].options[:i18n_options] = { :precision => 0 }
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
