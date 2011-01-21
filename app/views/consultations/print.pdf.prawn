if params[:print_current_condition]
  pdf.text "Condición actual", :size => 20, :style => :bold
  pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

  pdf.text params[:record][:current_condition]
end

if params[:print_medical_certificate]
  pdf.start_new_page
  pdf.text "Certificado médico", :size => 20, :style => :bold
  pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

  pdf.text "Peso:", :style => :bold
  pdf.text "#{params[:record][:weight]} kg."
  pdf.text "Talla:", :style => :bold
  pdf.text "#{params[:record][:height]} cm."
  pdf.text "Temperatura:", :style => :bold
  pdf.text "#{params[:record][:temperature]} ºC."
  pdf.text "Diagnóstico:", :style => :bold
  pdf.text params[:record][:diagnosis], :leading => 8

  pdf.text params[:record][:medical_certificate]
end

if params[:print_recipe]
  pdf.start_new_page
  pdf.text "Receta", :size => 20, :style => :bold
  pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

  pdf.text "Peso:", :style => :bold
  pdf.text "#{params[:record][:weight]} kg."
  pdf.text "Talla:", :style => :bold
  pdf.text "#{params[:record][:height]} cm."
  pdf.text "Temperatura:", :style => :bold
  pdf.text "#{params[:record][:temperature]} ºC."
  pdf.text "Diagnóstico:", :style => :bold
  pdf.text params[:record][:diagnosis], :leading => 8

  pdf.text params[:record][:recipe]
end

if params[:print_order]
  pdf.start_new_page
  pdf.text "Orden", :size => 20, :style => :bold
  pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

  pdf.text "Peso:", :style => :bold
  pdf.text "#{params[:record][:weight]} kg."
  pdf.text "Talla:", :style => :bold
  pdf.text "#{params[:record][:height]} cm."
  pdf.text "Temperatura:", :style => :bold
  pdf.text "#{params[:record][:temperature]} ºC."
  pdf.text "Diagnóstico:", :style => :bold
  pdf.text params[:record][:diagnosis], :leading => 8

  pdf.text params[:record][:order]
end

if params[:print_laboratory]
  pdf.start_new_page
  pdf.text "Laboratorio", :size => 20, :style => :bold
  pdf.text "#{@patient.first_name} #{@patient.last_name}", :leading => 8

  pdf.text "Peso:", :style => :bold
  pdf.text "#{params[:record][:weight]} kg."
  pdf.text "Talla:", :style => :bold
  pdf.text "#{params[:record][:height]} cm."
  pdf.text "Temperatura:", :style => :bold
  pdf.text "#{params[:record][:temperature]} ºC."
  pdf.text "Diagnóstico:", :style => :bold
  pdf.text params[:record][:diagnosis], :leading => 8

  pdf.text params[:record][:laboratory]
end