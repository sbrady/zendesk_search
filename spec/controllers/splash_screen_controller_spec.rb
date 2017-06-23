require 'spec_helper'

describe SplashScreenController do
  subject { SplashScreenController.new(SearchScreenController.new(nil)) }

  describe 'next_controller' do
    context 'when the input is a valid option' do
      it 'returns the next controller' do
        expect(subject.next_controller('1')).to be_a(SearchScreenController)
      end
    end

    context 'when the input is not valid option' do
      it 'returns its self' do
        expect(subject.next_controller('99')).to eql(subject)
      end
    end
  end

  describe '#render' do
    it 'renders its view' do
      expect(subject.render).to eql(SplashScreenView.new.render)
    end
  end

end
