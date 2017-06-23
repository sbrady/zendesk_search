require 'spec_helper'

describe FrontController do


  let(:splash_screen_controller) { SplashScreenController
                                       .new(SearchScreenController
                                                .new(UserSearchScreenController
                                                         .new(nil))) }
  subject { FrontController
                .new(splash_screen_controller) }

  describe '#process' do

    it 'returns the init controller' do
      expect(subject.process).to be_a(SplashScreenController)
    end

    context 'when a selection is made' do
      before do
        subject.process
      end
      it 'returns that selection' do
        expect(subject.process("1\n")).to be_a(SearchScreenController)
      end
      context 'when another selection is made' do
        before do
          subject.process("1\n")
        end
        it 'returns that selection' do
          expect(subject.process("1\n")).to be_a(UserSearchScreenController)
        end
      end

    end
  end

  describe '#render' do
    it 'delegates to the current controller' do
      expect(subject.render).to eql(splash_screen_controller.render)
    end

  end
end
