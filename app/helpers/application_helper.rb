# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def text_area_and_link_to_record_select(field, options, controller)
    column = active_scaffold_config.columns[field]
    active_scaffold_input_textarea(column, options) + link_to_record_select("Pick an existing #{field.to_s.gsub '_', ' '}", controller.to_s, { :onselect => "", :html => { :class => 'autocomplete_field' }})
  end
end
