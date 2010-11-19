class ConsultationsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "personal_data" do |group|
      group.add :weight, :height, :head_circumference, :anterior_fontanel, :temperature
    end
    action.columns.add_subgroup "current_condition" do |group|
      group.add :current_condition
    end
    action.columns.add_subgroup "recipe" do |group|
      group.add :recipe
    end
    action.columns.add_subgroup "diagnosis" do |group|
      group.add :diagnosis
    end
    action.columns.add_subgroup "medical_certificate" do |group|
      group.add :medical_certificate
    end
    action.columns.add_subgroup "order" do |group|
      group.add :order
    end
    action.columns.add_subgroup "laboratory" do |group|
      group.add :laboratory
    end
    action.columns.add_subgroup "amount" do |group|
      group.add :amount
    end
  end

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

#    add_sub_groups conf.create
#    add_sub_groups conf.update
    #add_sub_groups conf.show

    conf.action_links.add :print,
      :type => :member
    #      :parameters => { :id => "0" }

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

  def print
    if params[:record]
      consultation = Consultation.find params[:id]
      @patient = consultation.patient
      respond_to do |format|
        format.pdf do
          render :pdf => "print",
            :stylesheets => ["application","prince"],
            :layout => "pdf"
        end
      end
    else
      @record = Consultation.find params[:id]
      render :layout => false
    end
  end
  #  def print
  #    @consultation = Consultation.find params[:id]
  #    respond_to do |format|
  #      format.pdf do
  #        render :pdf => "print",
  #          :stylesheets => ["application","prince"],
  #          :layout => "pdf"
  #      end
  #    end
  #  end

end
