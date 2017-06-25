class SearchableFieldsScreenController

  def render
    SearchableFieldsScreenView.new(Model.all_child_fields).render
  end

end
