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
    #Columnas que se mostrarán al listar
    conf.list.columns = :photograph, :last_name, :first_name, :age, 
      :consultations, :family_records, :allergies, :perinatal_record,
      :surgical_records, :pathological_records, :surgeries, :hospitalizations

    #Columnas que se excluiran para todas las acciones
    conf.columns.exclude :photograph_content_type, :photograph_file_name,
      :photograph_file_size, :photograph_updated_at, :family_records,
      :allergies, :perinatal_record, :surgical_records, :pathological_records,
      :consultations, :surgeries, :hospitalizations

    #Botón generar historial
    conf.action_links.add :patient_history,
      :type => :member,
      :page => true

    #Botón clonar
    conf.action_links.add :clone,
      :type => :member,
      :confirm => as_(:clone_patient_question),
      :parameters => { :controller => 'patients', :action => 'new' }

    #:date_of_birth muestra muestre mas años
    conf.columns[:date_of_birth].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => false }

    #Eliminar las etiquetas al listar de todas las relaciones
    conf.columns[:consultations].label = ""
    conf.columns[:surgical_records].label = ""
    conf.columns[:pathological_records].label = ""
    conf.columns[:family_records].label = ""
    conf.columns[:allergies].label = ""
    conf.columns[:perinatal_record].label = ""
    conf.columns[:surgeries].label = ""
    conf.columns[:hospitalizations].label = ""
    
    #Algunos campos se muestran con :record_select
    conf.columns[:consultation_price].form_ui = :record_select
    conf.columns[:place].form_ui = :record_select

    #:perinatal_record es un nested action
    conf.columns[:perinatal_record].set_link 'nested',
      :controller =>'patients',
      :parameters => { :associations => :perinatal_record }

    #agrupar por categorias cada acción
    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show
  end

  #TODO: Tiene que existir una prueba para do_new cuando se quiere clonar
  def do_new
    if params[:id]
      @record = Patient.find(params[:id]).clone_patient
    else
      @record = new_model
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
end