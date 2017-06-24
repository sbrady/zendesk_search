require 'spec_helper'

describe UserRepository do
  let(:users) { [{_id: 9999, name: 'foo bar', organization_id: 777}] }
  let(:organizations) { [{_id: 777, details: 'super fun corp'}] }
  let(:organization_repository) { OrganizationRepository.new(organizations) }
  subject { UserRepository.new(users) }

  before do
    subject.repositories=[organization_repository]
  end

  describe 'find_by' do
    context 'when a string field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:name, 'foo bar').size).to eq(1)
        expect(subject.find_by(:name, 'foo bar').first).to be_a(User)
        expect(subject.find_by(:name, 'foo bar').first._id).to eql(9999)
      end
    end
    context 'when a number field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:_id, '9999').size).to eq(1)
        expect(subject.find_by(:_id, '9999').first).to be_a(User)
        expect(subject.find_by(:_id, '9999').first._id).to eql(9999)
      end
    end

    it 'has an organization' do
      user = subject.find_by(:_id, '9999').first
      expect(user.organization._id).to eql(777)
      expect(user.organization.details).to eql('super fun corp')
    end

  end

end
