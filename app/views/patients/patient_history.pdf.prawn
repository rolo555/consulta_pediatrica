pdf.text "Historial de paciente", :size => 20, :style => :bold, :align => :center
pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

pdf.text "Consultas", :style => :bold
pdf.text("Sin consultas", :style => :italic) if @patient.consultations.blank?
@patient.consultations.each do |c|
  pdf.text "Fecha", :style => :italic
  pdf.text c.created_at.to_s
  pdf.text "Diagnostico", :style => :italic
  pdf.text c.diagnosis
end

pdf.text "Registro familiar", :style => :bold
if @patient.family_records.blank?
  pdf.text("Sin registros", :style => :italic)
else
  pdf.text("Patología - relación", :style => :italic)
end
@patient.family_records.each do |r|
  pdf.text "#{r.pathology} - #{r.relation_ship}"
end

pdf.text "Alergias", :style => :bold
if @patient.allergies.blank?
  pdf.text("Sin alergias", :style => :italic)
else
  pdf.text "Substancia - reacción: ", :style => :italic
end
@patient.allergies.each do |r|
  pdf.text "#{r.substance} - #{r.reaction}"
end

pdf.text "Registros de cirugía", :style => :bold
pdf.text("Sin registros", :style => :italic) if @patient.surgical_records.blank?
@patient.surgical_records.each do |r|
  pdf.text r.pathology
end

pdf.text "Registros patologicos", :style => :bold
if @patient.pathological_records.blank?
  pdf.text("Sin registros", :style => :italic)
else
  pdf.text "Diagnóstico - tratamiento", :style => :italic
end
@patient.pathological_records.each do |r| 
  pdf.text "#{r.diagnosis} - #{r.treatment}"
end

pdf.text "Cirugías", :style => :bold
if @patient.surgeries.blank?
  pdf.text("Sin cirugías", :style => :italic)
else
  pdf.text "Diagnóstico", :style => :italic
end
@patient.surgeries.each do |r|
  pdf.text r.pre_operative_diagnosis.to_s
end

pdf.text "Hospitalizaciones", :style => :bold
pdf.text("Sin hospitalizaciones", :style => :italic) if @patient.hospitalizations.blank?
@patient.hospitalizations.each do |r|
  pdf.text r.to_label
end

pdf.text "Registro de vacunas", :style => :bold
pdf.text("Sin vacunas", :style => :italic) if @patient.immunization_records.blank?
@patient.immunization_records.each do |r|
  pdf.text r.to_label
end
