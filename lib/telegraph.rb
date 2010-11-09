# encoding: UTF-8

require File.dirname(__FILE__) + '/morse_characters'

# Telegraph module provides a simple text-to-morse, morse-to-text translator.
# 
# It uses as reference the document <t>RECOMMENDATION ITU-R M.1677</t> from the 
# International Telecommunication Union, Radiocommunication Sector (ITU-R), the United 
# Nations agency for information and communication technology issues.
#
module Telegraph
  include MorseCharacters
  
  # Transforms a string of plain text into a string of morse code 
  # using the character '.' as the short signal and the character '-' as the long signal.
  # The encode is made following the official RECOMMENDATION ITU-R M.1677.
  # The returned string uses a single space as letter separator and a seven spaces gap as word separator.
  #
  #   Telegraph.text_to_morse("Hello world")  #=> ".... . .-.. .-.. ---        .-- --- .-. .-.. -.."
  #
  def self.text_to_morse(text)
    text.strip.downcase.split(" ").inject([]){|morse_words, word| 
      morse_words << word.chars.inject(""){|morse_word, character| [morse_word, LETTERS_TO_MORSE[character]].join(" ").strip}
    }.join(LETTERS_TO_MORSE[" "]).strip
  end
  
  # Transforms a string of morse code into a string of text decoding using the RECOMMENDATION ITU-R M.1677.
  #
  # It expects the character '.' as the short signal, the character '-' as the long signal,
  # a space as separation between letters and seven spaces as separation between words.
  #
  # The returned string is completly downcased.
  #
  #   Telegraph.morse_to_text(".... . .-.. .-.. ---        .-- --- .-. .-.. -..")  #=> hello world"
  #
  def self.morse_to_text(morse)
    morse.split(LETTERS_TO_MORSE[" "]).inject([]){|words, morse_word|
      words << morse_word.split(" ").inject(""){|word, morse_char| word + MORSE_TO_LETTERS[morse_char]}
    }.join(" ")
  end

  # Telegraph::MorseTransmission class provides a simple text-to-morse, morse-to-text translator using 
  # user defined characters for short and long signals (defaults to '.' and '-').
  # 
  # It uses as reference the document <t>RECOMMENDATION ITU-R M.1677</t> from the 
  # International Telecommunication Union, Radiocommunication Sector (ITU-R), the United 
  # Nations agency for information and communication technology issues.
  #
  class MorseTransmission
    attr_accessor(:short, :long)
    
    # When instantiating the class two options can be provided to set the signals
    # to use by the new instance when reading and writing morse code:
    # 
    # * <tt>:short</tt> - The character to use as dot or short signal. Default: '.'
    # * <tt>:long</tt> - The character to use as dash or long signal. Default: '-'
    #
    def initialize(signals={})
      @short = signals[:short] || Telegraph::DOT
      @long = signals[:long] || Telegraph::DASH
    end
    
    # Transforms a string of plain text into a string of morse code 
    # using as short and long signals the characters defined by the user when the class was instantiated.
    # 
    # The returned string uses a single space as letter separator and a seven spaces gap as word separator.
    #
    #   morser = Telegraph::MorseTransmission.new(:short =>'x', :long => '3')
    #   morser.text_to_morse("Hello world")  #=> "xxxx x x3xx x3xx 333        x33 333 x3x x3xx 3xx"
    #
    def text_to_morse(text)
      morse = Telegraph.text_to_morse(text)
      dot_dash(morse)
    end
    
    # Transforms a string of morse code into a string of text decoding using the RECOMMENDATION ITU-R M.1677.
    # 
    # It expects as short and long signals the characters defined by the user when the class was instantiated,
    # a space as separation between letters and seven spaces as separation between words.
    # 
    # The returned string is completly downcased.
    #
    #   morser = Telegraph::MorseTransmission.new(:short =>'x', :long => '3')
    #   morser.morse_to_text("xxxx x x3xx x3xx 333        x33 333 x3x x3xx 3xx")  #=> hello world"
    #
    def morse_to_text(morse)
      morse = undo_dot_dash(morse.strip)
      Telegraph.morse_to_text(morse)
    end
    
    # Returns the 'Error' sign using the signal characters defined for this instance.
    def error
      dot_dash(Telegraph::Error)
    end
    
    # Returns the 'Understood' sign using the signal characters defined for this instance.
    def understood
      dot_dash(Telegraph::Understood)
    end
    
    # Returns the 'Invitation to transmit' sign using the signal characters defined for this instance.
    def invitation_to_transmit
      dot_dash(Telegraph::Invitation_to_transmit)
    end
    
    # Returns the 'Wait' sign using the signal characters defined for this instance.
    def wait
      dot_dash(Telegraph::Wait)
    end
    
    # Returns the 'End of work' sign using the signal characters defined for this instance.
    def end_of_work
      dot_dash(Telegraph::End_of_work)
    end
    
    # Returns the 'Starting signal' sign using the signal characters defined for this instance.
    def starting_signal
      dot_dash(Telegraph::Starting_signal)
    end
  
    private
    
    def dot_dash(text) #:nodoc:
      text = text.gsub(Telegraph::DOT, @short) unless @short == Telegraph::DOT
      text = text.gsub(Telegraph::DASH, @long) unless @long == Telegraph::DASH
      text  
    end
    
    def undo_dot_dash(morse) #:nodoc:
      morse = morse.gsub(@short, Telegraph::DOT) unless @short == Telegraph::DOT
      morse = morse.gsub(@long, Telegraph::DASH) unless @long == Telegraph::DASH
      morse
    end
  end

end
