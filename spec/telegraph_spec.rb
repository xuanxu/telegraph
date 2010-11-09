# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe Telegraph do
  
  describe 'Morse writer' do
    it "creates morse code from a simple text" do
      Telegraph.text_to_morse("A patient waiter is no loser.").should == 
      ".-       .--. .- - .. . -. -       .-- .- .. - . .-.       .. ...       -. ---       .-.. --- ... . .-. .-.-.-"
    end
    
    it "undestands some international characters (if ruby -v >= 1.9.2)" do
      Telegraph.text_to_morse("Añosé öresund").should == 
      ".- --.-- --- ... ..-..       ---. .-. . ... ..- -. -.."
    end
    
    it "undestands punctuation marks" do
      Telegraph.text_to_morse(".,:?").should == ".-.-.- --..-- ---... ..--.."
    end
    
    it "undestands basic math operators" do
      Telegraph.text_to_morse("3+100-(2x5)/10=299").should == 
      "...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----."
    end
    
    it "can write email addresses" do
      Telegraph.text_to_morse("morse@cod.es").should == "-- --- .-. ... . .--.-. -.-. --- -.. .-.-.- . ..."
    end
    
    it "create a seven space separation between morse words" do
      Telegraph.text_to_morse("a b").should == ".-       -..."
    end
    
    it "create a single space separation between morse letters" do
      Telegraph.text_to_morse("ab").should == ".- -..."
    end
    
    it "downcase every upcase letter" do
      Telegraph.text_to_morse("NBA").should == Telegraph.text_to_morse("nbA")
    end
    
    it "defines standard prosigns" do
      Telegraph::Error.should_not be_empty
      Telegraph::Understood.should_not be_empty
      Telegraph::Invitation_to_transmit.should_not be_empty
      Telegraph::Wait.should_not be_empty
      Telegraph::End_of_work.should_not be_empty
      Telegraph::Starting_signal.should_not be_empty
    end
  end
  
  describe 'Morse reader' do
    it "reads morse code" do
      Telegraph.morse_to_text("... - .-. . . - ...       ..-. ..- .-.. .-..       --- ..-.       .-- .- - . .-. .-.-.-       .--. .-.. . .- ... .       .- -.. ...- .. ... . .-.-.-  ").should == "streets full of water. please advise."
    end
    
    it "reads punctuation marks" do
      Telegraph.morse_to_text("..--.. .-.-.- --..-- ---...").should == "?.,:"
    end
    
    it "reads basic math operators" do
      Telegraph.morse_to_text("....- .-.-. .---- -----").should == "4+10"
    end
    
    it "takes seven spaces as words separation" do
      Telegraph.morse_to_text(".       -").should == "e t"
    end
    
    it "takes a single space as letters separation" do
      Telegraph.morse_to_text(". -").should == "et"
    end
    
    it "is consistent with the morse writer" do
      message = "A patient waiter is no loser."
      Telegraph.text_to_morse(message).should == Telegraph.text_to_morse(Telegraph.morse_to_text(Telegraph.text_to_morse(message)))
    end
  end
  
end