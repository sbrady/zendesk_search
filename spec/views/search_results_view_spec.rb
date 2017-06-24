require 'spec_helper'

describe SearchResultsView do

  subject { SearchResultsView.new(results) }

  context 'users' do
    let(:results) { [user_1, user_2] }
    let(:user_1) { User.new({_id: 11, name: 'some guy'}) }
    let(:user_2) { User.new({_id: 22, name: 'some other guy'}) }

    it 'displays users' do
      expect(subject.render).to include('_id:                  11')
      expect(subject.render).to include('name:            some guy')

      expect(subject.render).to include('_id:                  22')
      expect(subject.render).to include('name:      some other guy')
    end

  end

  context 'tickets' do
    let(:results) { [ticket_1, ticket_2] }
    let(:ticket_1) { Ticket.new({_id: 33, status: 'low'}) }
    let(:ticket_2) { Ticket.new({_id: 44, status: 'high'}) }

    it 'displays tickets' do
      expect(subject.render).to include('_id:                  33')
      expect(subject.render).to include('status:                 low')

      expect(subject.render).to include('_id:                  44')
      expect(subject.render).to include('status:                high')
    end

  end

end
