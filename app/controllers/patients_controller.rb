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
      group.add :consultation_price
      group.collapsed = true
    end
  end

  active_scaffold :patient do |conf|
    conf.list.per_page = 10
    conf.search.live = true

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:photograph, :last_name, :first_name, :age, :consultations, :family_records, :allergies, :perinatal_record, :surgical_records, :pathological_records]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :photograph_content_type, :photograph_file_name, :photograph_file_size, :photograph_updated_at, :family_records, :allergies, :perinatal_record, :surgical_records, :pathological_records, :consultations

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

    conf.columns[:surgical_records].label = ""

    conf.columns[:pathological_records].label = ""

    conf.columns[:family_records].label = ""

    conf.columns[:allergies].label = ""

    conf.columns[:perinatal_record].label = ""

    conf.columns[:consultation_price].form_ui = :select

    conf.columns[:place].form_ui = :record_select

    #Configuracion de :perinatal_record para que sea un nested action
    conf.columns[:perinatal_record].set_link 'nested',
      :controller =>'patients',
      :parameters => { :associations => :perinatal_record }
  end

  def do_new
    @params_id = params[:id]
    if @params_id.present?
      @record = Patient.find(@params_id).clone_patient
    else
      @record = active_scaffold_config.model.new
      @record.consultation_price = ConsultationPrice.find(:first, :conditions => { :default => true })
    end
    apply_constraints_to_record(@record)
    params[:eid] = @old_eid if @remove_eid
    @record
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

  def after_create_save(patient)
    patient.perinatal_record = PerinatalRecord.new
    patient.save
  end
end