require 'spec_helper'

describe SearchValueScreenView do

  subject { SearchValueScreenView.new }

  it 'displays the instruction' do
    expect(subject.render).to eql('Please enter search value:')
  end

end
