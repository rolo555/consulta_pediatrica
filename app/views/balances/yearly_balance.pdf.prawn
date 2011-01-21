data = []
@items.each do |k, v|
  data << [
    k,
    v["count"]["Consultation"],
    v["amount"]["Consultation"].blank? ? "" : v["amount"]["Consultation"].round(1).to_s,
    v["count"]["Surgery"],
    v["amount"]["Surgery"].blank? ? "" : v["amount"]["Surgery"].round(1).to_s,
    v["total_amount"].blank? ? "" : v["total_amount"].round(1).to_s
  ]
end

pdf.text "Balance anual", :align => :center, :size => 20
pdf.table data, :headers            => ["Año", "Cantidad consultas", "Monto consultas", "Cantidad cirugías", "Monto cirugías", "Monto total"],
                :font_size          => 10,
                :vertical_padding   => 2,
                :horizontal_padding => 5,
                :position           => :center,
                :row_colors         => :pdf_writer