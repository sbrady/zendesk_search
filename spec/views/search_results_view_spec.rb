require 'spec_helper'

describe SearchResultsView do

  subject { SearchResultsView.new(results) }

  context 'users' do
    let(:results) { [user_1, user_2] }
    let(:user_1) { User.new({_id: 11, name: 'some guy'}) }
    let(:user_2) { User.new({_id: 22, name: 'some other guy'}) }
    let(:organization) { Organization.new({_id: 888, deitals: 'super org'}) }
    it 'displays users' do
      user_2.organization=organization
      render_result = subject.render
      expect(render_result).to include('_id:                  11')
      expect(render_result).to include('name:            some guy')

      expect(render_result).to include('_id:                  22')
      expect(render_result).to include('name:      some other guy')
      expect(render_result).to include('organization:')
      expect(render_result).to include('_id:                 888')
      expect(render_result).to include('deitals:           super org')
    end

  end

  context 'tickets' do
    let(:results) { [ticket_1, ticket_2] }
    let(:ticket_1) { Ticket.new({_id: 33, status: 'low'}) }
    let(:ticket_2) { Ticket.new({_id: 44, status: 'high'}) }

    it 'displays tickets' do
      render_result = subject.render
      expect(render_result).to include('_id:                  33')
      expect(render_result).to include('status:                 low')

      expect(render_result).to include('_id:                  44')
      expect(render_result).to include('status:                high')
    end
  end

  context 'when there are no results' do
    let(:results) { nil }
    it 'says there are no results' do
      render_result = subject.render
      expect(render_result).to include("No Search Results Found\n")
    end
  end

end
