require 'spec_helper'

describe FrontController do
  let(:search_screen_controller) { SearchScreenController.new(nil) }
  let(:search_option_screen_controller) { SearchOptionScreenController.new([search_screen_controller]) }
  let(:splash_screen_controller) { SplashScreenController.new(search_option_screen_controller) }
  subject { FrontController.new(splash_screen_controller) }

  describe '#process' do

    it 'returns the init controller' do
      expect(subject.process).to eql(splash_screen_controller)
    end

    context 'when a selection is made' do
      before do
        subject.process
      end
      it 'returns that selection' do
        expect(subject.process("1\n")).to eql(search_option_screen_controller)
      end
      context 'when another selection is made' do
        before do
          subject.process("1\n")
        end
        it 'returns that selection' do
          expect(subject.process("1\n")).to eql(search_screen_controller)
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
