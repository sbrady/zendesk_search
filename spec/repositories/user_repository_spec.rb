require 'spec_helper'

describe UserRepository do
  let(:users) { [{_id: 9999, name: 'foo bar'}] }
  subject { UserRepository.new(users) }


  describe 'find_by' do

    context 'when a string field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:name,'foo bar').size).to eq(1)
        expect(subject.find_by(:name,'foo bar').first).to be_a(User)
        expect(subject.find_by(:name,'foo bar').first._id).to eql(9999)
      end
    end
    context 'when a number field' do
      it 'finds by the field and value' do
        expect(subject.find_by(:_id,'9999').size).to eq(1)
        expect(subject.find_by(:_id,'9999').first).to be_a(User)
        expect(subject.find_by(:_id,'9999').first._id).to eql(9999)
      end
    end
  end

end
