require 'spec_helper'

describe SearchableFieldsScreenController do
  subject { SearchableFieldsScreenController.new }

  describe 'next_controller' do
    it 'returns its self' do
      expect(subject.next_controller('ignore this')).to eql(subject)
    end
  end

  describe '#render' do

    before do
      allow(Model).to receive(:all_child_fields).and_return({'Class' => [:field1, :field2]})
    end

    it 'renders the searchable fields for all the models' do
      expected_render = SearchableFieldsScreenView.new(Model.all_child_fields).render
      expect(subject.render).to eql(expected_render)
    end

  end

end
