require 'spec_helper'

describe OrganizationRepository do
  let(:users) { [{_id: 9999, details: 'mega Corp'}] }
  subject { OrganizationRepository.new(users) }

  before do
    subject.repositories=[]
  end

  describe 'find_by' do
    context 'when a string field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:details,'mega Corp').size).to eq(1)
        expect(subject.find_by(:details,'mega Corp').first).to be_a(Organization)
        expect(subject.find_by(:details,'mega Corp').first._id).to eql(9999)
      end
    end
    context 'when a number field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:_id,'9999').size).to eq(1)
        expect(subject.find_by(:_id,'9999').first).to be_a(Organization)
        expect(subject.find_by(:_id,'9999').first._id).to eql(9999)
      end
    end
  end

end
