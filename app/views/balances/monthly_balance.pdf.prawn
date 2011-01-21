data = []
@items.each do |year, year_group|
  year_group.each do |month, v|
    data << [
      year,
      month,
      v["count"]["Consultation"],
      v["amount"]["Consultation"].blank? ? "" : v["amount"]["Consultation"].round(1).to_s,
      v["count"]["Surgery"],
      v["amount"]["Surgery"].blank? ? "" : v["amount"]["Surgery"].round(1).to_s,
      v["total_amount"].blank? ? "" : v["total_amount"].round(1).to_s
    ]
  end
end

pdf.text "Balance mensual", :align => :center, :size => 20
pdf.table data, :headers            => ["Año", "Mes", "Cantidad consultas", "Monto consultas", "Cantidad cirugías", "Monto cirugías", "Monto total"],
                :font_size          => 10,
                :vertical_padding   => 2,
                :horizontal_padding => 5,
                :position           => :center,
                :row_colors         => :pdf_writer