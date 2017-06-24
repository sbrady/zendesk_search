require 'spec_helper'

describe TicketRepository do

  let(:repositories) {}
  let(:organizations) { [{_id: 777, details: 'super fun corp'}] }
  let(:organization_repository) { OrganizationRepository.new(organizations) }

  let(:users) { [{_id: 1234, name: 'Mr submitter'}, {_id: 56789, name: 'Ms assignee'}] }
  let(:user_repository) { UserRepository.new(users) }

  let(:tickets) { [{_id: 9999, status: 'high', organization_id: 777, submitter_id: 1234, assignee_id: 56789}] }
  subject { TicketRepository.new(tickets, ) }

  before do
    subject.repositories=[organization_repository, user_repository]
  end

  describe 'find_by' do

    context 'when a string field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:status, 'high').size).to eq(1)
        expect(subject.find_by(:status, 'high').first).to be_a(Ticket)
        expect(subject.find_by(:status, 'high').first._id).to eql(9999)
      end
    end
    context 'when a number field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:_id, '9999').size).to eq(1)
        expect(subject.find_by(:_id, '9999').first).to be_a(Ticket)
        expect(subject.find_by(:_id, '9999').first._id).to eql(9999)
      end
    end
    it 'has an organization' do
      ticket = subject.find_by(:_id, '9999').first
      expect(ticket.organization._id).to eql(777)
      expect(ticket.organization.details).to eql('super fun corp')
    end

    it 'has a submitter' do
      ticket = subject.find_by(:_id, '9999').first
      expect(ticket.submitter._id).to eql(1234)
      expect(ticket.submitter.name).to eql('Mr submitter')
    end

    it 'has a assignee' do
      ticket = subject.find_by(:_id, '9999').first
      expect(ticket.assignee._id).to eql(56789)
      expect(ticket.assignee.name).to eql('Ms assignee')
    end


  end

end
