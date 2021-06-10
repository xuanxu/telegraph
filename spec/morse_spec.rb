# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe Telegraph::MorseTransmission do

  describe 'Custom Morse Transmission' do
    it "uses default signal characters if none provided" do
      morser = Telegraph::MorseTransmission.new
      expect(morser.text_to_morse("ET")).to eq ". -"
      expect(morser.text_to_morse("ET")).to eq "#{Telegraph::DOT} #{Telegraph::DASH}"
    end

    it "uses Telegraph methods if default signal characters" do
      morser = Telegraph::MorseTransmission.new
      expect(morser.text_to_morse("Winston is back")).to eq Telegraph.text_to_morse("Winston is back")
      expect(morser.morse_to_text(".... . .-.. .-.. ---       .-- --- .-. .-.. -..")).to eq Telegraph.morse_to_text(".... . .-.. .-.. ---       .-- --- .-. .-.. -..")
      expect(morser.text_to_morse("Winston is back")).to eq Telegraph.text_to_morse("Winston is back")
      expect(morser.error).to eq Telegraph::Error
      expect(morser.understood).to eq Telegraph::Understood
      expect(morser.invitation_to_transmit).to eq Telegraph::Invitation_to_transmit
      expect(morser.wait).to eq Telegraph::Wait
      expect(morser.end_of_work).to eq Telegraph::End_of_work
      expect(morser.starting_signal).to eq Telegraph::Starting_signal
    end

    it "uses default signal if no provided signal char" do
      morser = Telegraph::MorseTransmission.new short: 's'
      expect(morser.text_to_morse("ET")).to eq "s -"
      expect(morser.text_to_morse("ET")).to eq "s #{Telegraph::DASH}"


      morser = Telegraph::MorseTransmission.new long: 'j'
      expect(morser.text_to_morse("ET")).to eq ". j"
      expect(morser.text_to_morse("ET")).to eq "#{Telegraph::DOT} j"
    end

    it "write signal characters provided by user" do
      morser = Telegraph::MorseTransmission.new(short: '3', long: 'X')
      expect(morser.text_to_morse("ET")).to eq "3 X"
      expect(morser.text_to_morse("ET")).to_not eq Telegraph.text_to_morse("ET")
      expect(morser.text_to_morse("Winston is back")).to eq "3XX 33 X3 333 X XXX X3       33 333       X333 3X X3X3 X3X"
      expect(morser.error).to eq "33333333"
    end

    it "reads signal characters provided by user" do
      morser = Telegraph::MorseTransmission.new(short: '%', long: '+')
      expect(morser.morse_to_text("% +")).to eq "et"
      expect(morser.morse_to_text("%%%%+ %+%+% %++++ +++++")).to eq "4+10"
    end
  end

end