require 'spec_helper'

describe SplashScreenController do
  let(:splash_screen_options){[:controller_option1, :controller_option2]}
  subject { SplashScreenController.new(splash_screen_options) }

  describe 'next_controller' do
    context 'when the input is a valid option' do

      it 'returns the 1st option controller' do
        expect(subject.next_controller('1')).to eql(:controller_option1)
      end

      it 'returns the 2nd option controller' do
        expect(subject.next_controller('2')).to eql(:controller_option2)
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
