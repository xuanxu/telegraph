# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe Telegraph do

  describe 'Morse writer' do
    it "creates morse code from a simple text" do
      expect(Telegraph.text_to_morse("A patient waiter is no loser.")).to eq(
      ".-       .--. .- - .. . -. -       .-- .- .. - . .-.       .. ...       -. ---       .-.. --- ... . .-. .-.-.-")
    end

    it "undestands some international characters (if ruby -v >= 1.9.2)" do
      expect(Telegraph.text_to_morse("Añosé öresund")).to eq ".- --.-- --- ... ..-..       ---. .-. . ... ..- -. -.."
    end

    it "undestands punctuation marks" do
      expect(Telegraph.text_to_morse(".,:?")).to eq ".-.-.- --..-- ---... ..--.."
    end

    it "undestands basic math operators" do
      expect(Telegraph.text_to_morse("3+100-(2x5)/10=299")).to eq(
      "...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----.")
    end

    it "can write email addresses" do
      expect(Telegraph.text_to_morse("morse@cod.es")).to eq "-- --- .-. ... . .--.-. -.-. --- -.. .-.-.- . ..."
    end

    it "create a seven space separation between morse words" do
      expect(Telegraph.text_to_morse("a b")).to eq ".-       -..."
    end

    it "create a single space separation between morse letters" do
      expect(Telegraph.text_to_morse("ab")).to eq ".- -..."
    end

    it "downcase every upcase letter" do
      expect(Telegraph.text_to_morse("NBA")).to eq Telegraph.text_to_morse("nbA")
    end

    it "defines standard prosigns" do
      expect(Telegraph::Error).not_to be_empty
      expect(Telegraph::Understood).not_to be_empty
      expect(Telegraph::Invitation_to_transmit).not_to be_empty
      expect(Telegraph::Wait).not_to be_empty
      expect(Telegraph::End_of_work).not_to be_empty
      expect(Telegraph::Starting_signal).not_to be_empty
    end
  end

  describe 'Morse reader' do
    it "reads morse code" do
      expect(Telegraph.morse_to_text("... - .-. . . - ...       ..-. ..- .-.. .-..       --- ..-.       .-- .- - . .-. .-.-.-       .--. .-.. . .- ... .       .- -.. ...- .. ... . .-.-.-  ")).to eq "streets full of water. please advise."
    end

    it "reads punctuation marks" do
      expect(Telegraph.morse_to_text("..--.. .-.-.- --..-- ---...")).to eq "?.,:"
    end

    it "reads basic math operators" do
      expect(Telegraph.morse_to_text("....- .-.-. .---- -----")).to eq "4+10"
    end

    it "takes seven spaces as words separation" do
      expect(Telegraph.morse_to_text(".       -")).to eq "e t"
    end

    it "takes a single space as letters separation" do
      expect(Telegraph.morse_to_text(". -")).to eq "et"
    end

    it "is consistent with the morse writer" do
      message = "A patient waiter is no loser."
      expect(Telegraph.text_to_morse(message)).to eq Telegraph.text_to_morse(Telegraph.morse_to_text(Telegraph.text_to_morse(message)))
    end
  end

end