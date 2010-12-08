class DiagnosticsController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_diagnostic

  active_scaffold :diagnostics do |conf|
    conf.columns[:drugs].form_ui = :record_select
  end
  
  def add_diagnostic(record)
    @diagnostic = Diagnostic.find(params[:id])
    @view = 'add_diagnostic'
  end
end
