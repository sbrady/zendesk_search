require 'spec_helper'

describe FrontController do
  let(:search_screen_controller) { SearchScreenController.new(nil) }
  let(:search_option_screen_controller) { OptionsScreenController.new([search_screen_controller], nil) }
  let(:splash_screen_view) { SplashScreenView.new }
  let(:splash_screen_controller) { OptionsScreenController.new([search_option_screen_controller], splash_screen_view) }
  let(:mock_program_ender) { double('ProgramEnder') }
  subject { FrontController.new(splash_screen_controller, mock_program_ender) }

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
      context 'when an invalid selection is made' do
        before do

        end

        it 'prints the error message' do
          expect(subject).to receive(:puts).with("fakestuff is not valid a option\n")
          subject.process("fakestuff\n")
        end
        it 'returns the current controller' do
          expect(subject.process("fakestuff\n")).to eq(splash_screen_controller)
        end
      end
    end

    it 'ends the program when quit' do
      expect(mock_program_ender).to receive(:shut_down!)

      subject.process('quit')
    end
  end

  describe '#render' do
    it 'delegates to the current controller' do
      expect(subject.render).to eql(splash_screen_controller.render)
    end

  end
end
