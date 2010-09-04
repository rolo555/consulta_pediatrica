module ActiveScaffoldHelper
  def add_required_columns(config, model)
    req_cols = model.reflect_on_all_validations
    if req_cols != nil
      req_cols.delete_if{|col| col.macro.to_s != 'validates_presence_of'}
      req_cols.each{|col| config.columns[col.name.to_s].required = true if config.columns.member?(col.name.to_s)}
    end
  end
end
