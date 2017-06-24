require 'spec_helper'

describe SearchOptionScreenController do
  let(:ticket_search_controller) { SearchScreenController.new(nil) }
  let(:user_search_controller) { SearchScreenController.new(nil) }

  subject { SearchOptionScreenController.new([user_search_controller, ticket_search_controller]) }

  describe '#next_controller' do
    context 'when the input is a valid option' do
      it 'returns the 1st option controller' do
        expect(subject.next_controller('1')).to eql(user_search_controller)
      end

      it 'returns the 2nd option controller' do
        expect(subject.next_controller('2')).to eql(ticket_search_controller)
      end
    end

    context 'when the input is not valid option' do
      it 'returns its self' do
        expect(subject.next_controller('99')).to eql(subject)
      end
    end
  end

  describe '#render' do
    it 'renders its view' do
      expect(subject.render).to eql(SearchOptionScreenView.new.render)
    end
  end

end
