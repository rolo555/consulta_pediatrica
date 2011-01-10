module ApplicationRecordsHelper
  def options_for_association_conditions(association)
    if association.name == :vaccine
      { 'vaccines.vaccines_name_id' => @record.immunization_record.vaccines_name_id }
    else
      super
    end
  end
end
