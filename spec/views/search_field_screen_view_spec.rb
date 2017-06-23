require 'spec_helper'

describe SearchFieldScreenView do

  subject { SearchFieldScreenView.new }

  it 'displays the instruction' do
    expect(subject.render).to eql('Please enter a search field:')
  end

end
