# encoding: UTF-8

module Telegraph

  class RMorse
    include MorseCharacters
  
    attr_accessor(:short, :long)
  
    def text_to_morse(text)
      morse = text.strip.downcase.split(" ").inject([]){|morse_words, word| 
        morse_words << word.chars.inject(""){|morse_word, character| [morse_word, LETTERS_TO_MORSE[character]].join(" ")}
      }.join(LETTERS_TO_MORSE[" "]).strip
      dot_dash(morse)
    end
  
    def morse_to_text(morse)
      morse = undo_dot_dash(morse.strip)
      text = morse.split(LETTERS_TO_MORSE[" "]).inject([]){|words, morse_word|
        words << morse_word.split(" ").inject(""){|word, morse_char| word + MORSE_TO_LETTERS[morse_char]}
      }.join(" ")
    end
  
    def error
      dot_dash(Error)
    end
  
    def understood
      dot_dash(Understood)
    end
  
    def invitation_to_transmit
      dot_dash(Invitation_to_transmit)
    end
  
    def wait
      dot_dash(Wait)
    end
  
    def end_of_work
      dot_dash(End_of_work)
    end
  
    def starting_signal
      dot_dash(Starting_signal)
    end
  
    def initialize(signals={})
      @short = signals[:short] || Dot
      @long = signals[:long] || Dash
    end
  
    private
  
    def dot_dash(text)
      text = text.gsub(Dot, @short) unless @short == Dot
      text = text.gsub(Dash, @long) unless @long == Dash
      text  
    end
    
    def undo_dot_dash(morse)
      morse = morse.gsub(@short, Dot) unless @short == Dot
      morse = morse.gsub(@long, Dash) unless @long == Dash
      morse
    end
  end

end
