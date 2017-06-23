require 'spec_helper'

describe SearchScreenView do

  subject { SearchScreenView.new }

  it 'displays the search options' do
    expect(subject.render).to include('Select from search options:')
    expect(subject.render).to include('1) Users')
  end

end
