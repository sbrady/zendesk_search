class SearchableFieldsScreenController

  def next_controller(_)
    self
  end

  def render
    SearchableFieldsScreenView.new(Model.all_child_fields).render
  end

end
