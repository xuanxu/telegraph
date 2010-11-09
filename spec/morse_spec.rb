# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe Telegraph::MorseTransmission do
  
  describe 'Custom Morse Transmission' do
    it "uses default signal characters if none provided" do
      morser = Telegraph::MorseTransmission.new
      morser.text_to_morse("ET").should == ". -"
      morser.text_to_morse("ET").should == "#{Telegraph::DOT} #{Telegraph::DASH}"
    end
    
    it "uses Telegraph methods if default signal characters" do
      morser = Telegraph::MorseTransmission.new
      morser.text_to_morse("Winston is back").should == Telegraph.text_to_morse("Winston is back")
      morser.morse_to_text(".... . .-.. .-.. ---        .-- --- .-. .-.. -..").should == 
             Telegraph.morse_to_text(".... . .-.. .-.. ---        .-- --- .-. .-.. -..")
      morser.text_to_morse("Winston is back").should == Telegraph.text_to_morse("Winston is back")
      morser.error.should == Telegraph::Error
      morser.understood.should == Telegraph::Understood
      morser.invitation_to_transmit.should == Telegraph::Invitation_to_transmit
      morser.wait.should == Telegraph::Wait
      morser.end_of_work.should == Telegraph::End_of_work
      morser.starting_signal.should == Telegraph::Starting_signal
    end
    
    it "uses default signal if no provided signal char" do
      morser = Telegraph::MorseTransmission.new :short => 's'
      morser.text_to_morse("ET").should == "s -"
      morser.text_to_morse("ET").should == "s #{Telegraph::DASH}"
      
      
      morser = Telegraph::MorseTransmission.new :long => 'j'
      morser.text_to_morse("ET").should == ". j"
      morser.text_to_morse("ET").should == "#{Telegraph::DOT} j"
    end
    
    it "write signal characters provided by user" do
      morser = Telegraph::MorseTransmission.new(:short => '3', :long => 'X')
      morser.text_to_morse("ET").should == "3 X"
      morser.text_to_morse("ET").should_not == Telegraph.text_to_morse("ET")
      morser.text_to_morse("Winston is back").should == "3XX 33 X3 333 X XXX X3       33 333       X333 3X X3X3 X3X"
      morser.error.should == "33333333"
    end
    
    it "reads signal characters provided by user" do
      morser = Telegraph::MorseTransmission.new(:short => '%', :long => '+')
      morser.morse_to_text("% +").should == "et"
      morser.morse_to_text("%%%%+ %+%+% %++++ +++++").should == "4+10"
    end
  end
  
end