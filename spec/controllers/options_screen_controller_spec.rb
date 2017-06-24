require 'spec_helper'

describe OptionsScreenController do
  let(:screen_options){[:controller_option1, :controller_option2]}
  let(:view){SplashScreenView.new}
  subject { OptionsScreenController.new(screen_options, view) }

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
      it 'displays a error msg when out of range' do
        expect{subject.next_controller('99')}
            .to raise_error(InvalidInputError, "99 is not valid a option")
      end
      it 'displays a error msg when not a number' do
        expect{subject.next_controller('number 1 please!')}
            .to raise_error(InvalidInputError, "number 1 please! is not valid a option")
      end

    end
  end

  describe '#render' do
    it 'renders its view' do
      expect(subject.render).to eql(view.render)
    end
  end

end
