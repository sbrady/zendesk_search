require 'spec_helper'

describe SearchOptionScreenView do

  subject { SearchOptionScreenView.new }

  it 'displays the search options' do
    expect(subject.render).to include('Select from search options:')
    expect(subject.render).to include('1) Users')
    expect(subject.render).to include('2) Tickets')
    expect(subject.render).to include('3) Organizations')
  end

end
