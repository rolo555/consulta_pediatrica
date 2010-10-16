class DiagnosticsController < ApplicationController
  record_select :per_page => 5,
    :search_on => ['name'],
    :full_text_search => true,
    :notify => :add_diagnostic

  active_scaffold :diagnostics do |conf|
    conf.list.per_page = 10
    conf.search.live = true
    conf.list.columns = [:name]
    conf.columns.exclude :created_at, :updated_at
  end

  def add_diagnostic(record)
    @diagnostic = Diagnostic.find(params[:id])
    @view = 'add_diagnostic'
  end
end
