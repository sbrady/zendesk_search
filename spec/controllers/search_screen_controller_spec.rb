require 'spec_helper'

describe SearchScreenController do
  let(:users) { [{_id: '9999', name: 'foo bar'}] }
  let(:repository) { UserRepository.new(users) }
  subject { SearchScreenController.new(repository) }

  describe 'next_controller' do
    context 'when the input is a valid field' do
      it 'returns self' do
        expect(subject.next_controller('_id')).to eql(subject)
      end
      it 'renders the search value view' do
        subject.next_controller('_id')
        expect(subject.render).to eql(SearchValueScreenView.new.render)
      end

      context 'when next_controller is called again' do
        it 'returns self' do
          expect(subject.next_controller('9999')).to eql(subject)
        end

        it 'renders the found search result' do
          subject.next_controller('_id')
          subject.next_controller('9999')
          expect(subject.render).to eql(SearchResultsView.new([User.new(users[0])]).render)
        end
      end

    end

    context 'when the input is not valid option' do
      it 'returns its self' do
        expect(subject.next_controller('99asdf')).to eql(subject)
      end
    end
  end

  describe '#render' do
    it 'renders its initial view' do
      expect(subject.render).to eql(SearchFieldScreenView.new.render)
    end
  end

end
