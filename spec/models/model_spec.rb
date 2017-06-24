require 'spec_helper'

describe Model do
  subject do
    class Foo < Model
    end
    Foo
  end

  describe 'initialize' do
    it 'can have arbitrary fields in a child' do
      foo = subject.new({hi: 'there', good: 'bye'})
      expect(foo.hi).to eql('there')
      expect(foo.good).to eql('bye')
    end
  end

  describe 'all_fields' do
    it 'reports all fields for a child' do
      subject.new({hi: 'there', good: 'bye'})
      expect(Foo.all_fields).to eql([:hi, :good])
    end
  end

  describe 'all_child_fields' do
    it 'reports all fields for all of its children' do
      class Bar < Model
      end
      Bar.new({boo: 'hoo'})
      subject.new({hi: 'there', good: 'bye'})
      expect(Model.all_child_fields['Foo']).to eql([:hi,:good])
      expect(Model.all_child_fields['Bar']).to eql([:boo])
    end
  end


end