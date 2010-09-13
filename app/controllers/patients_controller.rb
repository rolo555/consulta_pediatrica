class PatientsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "Personal data" do |group|
      group.add :photograph, :first_name, :last_name, :date_of_birth, :place
    end
    action.columns.add_subgroup "Parents data" do |group|
      group.add :mother, :father, :addresses, :phone_numbers, :emails
    end
    action.columns.add_subgroup "Medical data" do |group|
      group.add :referenced_by, :observations
    end
    action.columns.add_subgroup "Amount" do |group|
      group.add :patient_price
      group.collapsed = true
    end
  end

  active_scaffold :patient do |conf|

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:photograph, :last_name, :first_name, :age, :emails, :addresses, :consultations]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :consultations, :photograph_content_type, :photograph_file_name, :photograph_file_size, :photograph_updated_at

    #Configuración del boton generar historial
    conf.action_links.add :patient_history,
      :type => :member,
      :page => true

    #Configuración del boton clonar
    conf.action_links.add :clone,
      :type => :member,
      :confirm => "Are you sure to clone patient?",
      :parameters => { :controller => 'patients', :action => 'new' }

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]

    #Configuración de los agrupados por categorias para la acción create
    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show

    #Configuracion de [:date_of_birth] para que muestre mas años
    conf.columns[:date_of_birth].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => false }

    conf.columns[:consultations].label = ""

    conf.columns[:patient_price].form_ui = :select

    conf.columns[:place].form_ui = :record_select
  end
  
  def do_new
    @params_id = params[:id]
    if @params_id.present?
      @record = Patient.find(@params_id).clone_patient
    else
      @record = active_scaffold_config.model.new
      apply_constraints_to_record(@record)
      params[:eid] = @old_eid if @remove_eid
      @record
    end
  end

  def patient_history
    @patient = Patient.find params[:id]
    respond_to do |format|
      format.pdf do
        render :pdf => "patient_history",
               :stylesheets => ["application","prince"],
               :layout => "pdf"
      end
    end
  end
end