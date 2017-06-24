require 'spec_helper'

describe TicketRepository do
  let(:tickets) { [{_id: 9999, status: 'high'}] }
  subject { TicketRepository.new(tickets) }


  describe 'find_by' do

    context 'when a string field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:status,'high').size).to eq(1)
        expect(subject.find_by(:status,'high').first).to be_a(Ticket)
        expect(subject.find_by(:status,'high').first._id).to eql(9999)
      end
    end
    context 'when a number field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:_id,'9999').size).to eq(1)
        expect(subject.find_by(:_id,'9999').first).to be_a(Ticket)
        expect(subject.find_by(:_id,'9999').first._id).to eql(9999)
      end
    end
  end

end
