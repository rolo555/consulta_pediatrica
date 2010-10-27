class MedicalCertificatesController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_medical_certificate

  active_scaffold :medical_certificates do |conf|
    #Configuración de las columnas que se mostrarán
    conf.columns = [:name, :text]
  end

  def add_medical_certificate(record)
    @medical_certificate = MedicalCertificate.find(params[:id])
    @view = 'add_medical_certificate'
  end
end
