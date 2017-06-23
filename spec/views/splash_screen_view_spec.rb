require 'spec_helper'

describe SplashScreenView do

  subject { SplashScreenView.new }

  it 'displays the welcome message' do
    expect(subject.render).to include('Welcome to Zendesk Search')
  end

  it 'displays options' do
    expect(subject.render).to include('Press 1 to search Zendesk')
  end

end
