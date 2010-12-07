module ConsultationsHelper
  def consultation_laboratory_form_column(record, options)
    text_area_and_link_to_record_select(:laboratory, options, :laboratory_profiles) + (params[:action] == "print" ? check_box_tag(:print_laboratory) : "")
  end

  def consultation_diagnosis_form_column(record, options)
    options[:onchange] = remote_function(:url => { :controller => :consultations, :action => :update_drugs, :id => " " }, :with => "'diagnoses=' + $('#{options[:id]}').value", :update => "suggested_drugs")
    text_area_and_link_to_record_select :diagnosis, options, :diagnostics
  end

  def consultation_medical_certificate_form_column(record, options)
    text_area_and_link_to_record_select(:medical_certificate, options, :medical_certificates) + (params[:action] == "print" ? check_box_tag(:print_medical_certificate) : "")
  end

  def consultation_order_form_column(record, options)
    text_area_and_link_to_record_select(:order, options, :medical_orders) + (params[:action] == "print" ? check_box_tag(:print_order) : "")
  end

  def consultation_recipe_form_column(record, options)
    column = active_scaffold_config.columns[:recipe]
    active_scaffold_input_textarea(column, options) + (params[:action] == "print" ? check_box_tag(:print_recipe) : "")
  end

  def consultation_current_condition_form_column(record, options)
    column = active_scaffold_config.columns[:current_condition]
    active_scaffold_input_textarea(column, options) + (params[:action] == "print" ? check_box_tag(:print_current_condition) : "")
  end

  def consultation_images_column(record)
    unless record.images.empty?
      record.images.collect { |i|
        image_tag i.image.url(:thumbnail)
      }
    else
      "-"
    end
  end

  def consultation_suggested_drugs_form_column(record, options)
    content_tag "span", "", options
  end
end
