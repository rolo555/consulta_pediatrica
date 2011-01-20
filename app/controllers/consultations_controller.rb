class ConsultationsController < ApplicationController
  active_scaffold :consultation do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:weight, :height, :head_circumference, :anterior_fontanel,
      :temperature, :current_condition, :diagnosis, :suggested_drugs,
      :medical_certificate, :recipe, :order, :laboratory, :amount]

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:diagnosis, :recipe, :amount, :images,
      :surgery_quotations]

    #Configuración de cómo se mostrará la columna amount
    conf.columns[:amount].options[:format] = nil
    
    conf.columns[:weight].options[:format] = nil
    conf.columns[:height].options[:format] = nil
    conf.columns[:head_circumference].options[:format] = nil
    conf.columns[:temperature].options[:format] = nil

    conf.action_links.add :print,
      :type => :member
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
        format.pdf { render :layout => false }
      end
    else
      @record = Consultation.find params[:id]
      render :layout => false
    end
  end

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
