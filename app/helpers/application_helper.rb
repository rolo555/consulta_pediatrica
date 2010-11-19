# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def text_area_and_link_to_record_select(field, options, controller)
    column = active_scaffold_config.columns[field]
    active_scaffold_input_textarea(column, options) + link_to_record_select(image_tag("active_scaffold/default/magnifier.png")+" Find", controller.to_s, { :onselect => "", :html => { :class => 'autocomplete_field' }})
  end

  def plural_for(model)
    #as_("#{model}.other", :scope => "activerecord.models")
    active_scaffold_config_for(model).list.label
  end
end
