class SurgicalStaffsController < ApplicationController
  record_select :per_page => 5,
    :search_on => 'concept',
    :full_text_search => true

  active_scaffold :surgical_staffs do |conf|
    conf.columns = :is_always_present, :staff

    #Agregar a :is_always_present para que la búsqueda lo incluya
    conf.search.columns << :is_always_present
  end

  def index
    if params[:must_close]
      render :template => "close", :layout => false
    else
      list
    end
  end

end
