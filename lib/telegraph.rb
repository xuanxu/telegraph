# encoding: UTF-8

# Telegraph.
# 
#
module Telegraph
  include MorseCharacters
  
  def self.text_to_morse(text)
    text.strip.downcase.split(" ").inject([]){|morse_words, word| 
      morse_words << word.chars.inject(""){|morse_word, character| [morse_word, LETTERS_TO_MORSE[character]].join(" ").strip}
    }.join(LETTERS_TO_MORSE[" "]).strip
  end
  
  def self.morse_to_text(morse)
    morse.split(LETTERS_TO_MORSE[" "]).inject([]){|words, morse_word|
      words << morse_word.split(" ").inject(""){|word, morse_char| word + MORSE_TO_LETTERS[morse_char]}
    }.join(" ")
  end

  class MorseTransmission
    attr_accessor(:short, :long)
    
    def initialize(signals={})
      @short = signals[:short] || Telegraph::DOT
      @long = signals[:long] || Telegraph::DASH
    end
    
    def text_to_morse(text)
      morse = Telegraph.text_to_morse(text)
      dot_dash(morse)
    end
  
    def morse_to_text(morse)
      morse = undo_dot_dash(morse.strip)
      Telegraph.morse_to_text(morse)
    end
  
    def error
      dot_dash(Telegraph::Error)
    end
  
    def understood
      dot_dash(Telegraph::Understood)
    end
  
    def invitation_to_transmit
      dot_dash(Telegraph::Invitation_to_transmit)
    end
  
    def wait
      dot_dash(Telegraph::Wait)
    end
  
    def end_of_work
      dot_dash(Telegraph::End_of_work)
    end
  
    def starting_signal
      dot_dash(Telegraph::Starting_signal)
    end
  
    private
  
    def dot_dash(text)
      text = text.gsub(Telegraph::DOT, @short) unless @short == Telegraph::DOT
      text = text.gsub(Telegraph::DASH, @long) unless @long == Telegraph::DASH
      text  
    end
    
    def undo_dot_dash(morse)
      morse = morse.gsub(@short, Telegraph::DOT) unless @short == Telegraph::DOT
      morse = morse.gsub(@long, Telegraph::DASH) unless @long == Telegraph::DASH
      morse
    end
  end

end
