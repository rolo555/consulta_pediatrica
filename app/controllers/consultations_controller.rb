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
      :temperature, :current_condition, :diagnosis, :suggested_drugs,
      :medical_certificate, :recipe, :order, :laboratory, :amount]

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

  def do_new
    super
    @record.set_amount
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

  def update_drugs
    @drugs = Set.new
    if params[:diagnoses].present?
      possible_diagnoses = params[:diagnoses].split(/[\,\;\.\n\r]/).map {|i| i.strip}.delete_if {|i| i.strip.empty?}
      possible_diagnoses.each do |possible_diagnosis|
        diagnoses = Diagnostic.all :conditions => ["UPPER(name) LIKE ?", "%#{possible_diagnosis.upcase}%"], :include => :drugs
        diagnoses.each {|diagnosis| @drugs = @drugs.union diagnosis.drugs}
      end
    end
  end

  def add_recipe
    @drug = Drug.find params[:id]
    @weigth = params[:weight]
    @heigth = params[:height]
  end
end
