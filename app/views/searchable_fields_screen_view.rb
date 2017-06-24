class SearchableFieldsScreenView

  def initialize(searchable_fields)
    @searchable_fields = searchable_fields
  end


  def render
    @searchable_fields.map do|type, fields|
      "Search #{type} With:\n" + fields.join("\n")
    end.join("\n\n")
  end

end
