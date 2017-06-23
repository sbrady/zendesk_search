require 'spec_helper'

describe UserScreenView do

  let(:user_1){User.new({_id:'11', name: 'some guy'})}
  let(:user_2){User.new({_id:'22', name: 'some other guy'})}

  subject { UserScreenView.new([user_1, user_2]) }

  it 'displays users' do
    expect(subject.render).to include('id:    11')
    expect(subject.render).to include('name:    some guy')

    expect(subject.render).to include('id:    22')
    expect(subject.render).to include('name:    some other guy')
  end

end
