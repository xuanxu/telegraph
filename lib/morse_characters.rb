# encoding: UTF-8
module MorseCharacters
  
  # Official characters from the RECOMMENDATION ITU-R M.1677: International Morse code.
  ITU_Morse = {
    "a" => ".-",
    "b" => "-...",
    "c" => "-.-.",
    "d" => "-..",
    "e" => ".",
    "f" => "..-.",
    "g" => "--.",
    "h" => "....",
    "i" => "..",
    "j" => ".---",
    "k" => "-.-",
    "l" => ".-..",
    "m" => "--",
    "n" => "-.",
    "o" => "---",
    "p" => ".--.",
    "q" => "--.-",
    "r" => ".-.",
    "s" => "...",
    "t" => "-",
    "u" => "..-",
    "v" => "...-",
    "w" => ".--",
    "x" => "-..-",
    "y" => "-.--",
    "z" => "--..",
    "0" => "-----",
    "1" => ".----",
    "2" => "..---",
    "3" => "...--",
    "4" => "....-",
    "5" => ".....",
    "6" => "-....",
    "7" => "--...",
    "8" => "---..",
    "9" => "----.",
    "." => ".-.-.-",
    "," => "--..--",
    ":" => "---...",
    "?" => "..--..",
    "’" => ".----.",
    "–" => "-....-",
    "-" => "-....-",
    "/" => "-..-.",
    "(" => "-.--.",
    ")" => "-.--.-",
    "“" => ".-..-.",
    "”" => ".-..-.",
    "\""=> ".-..-.",
    "=" => "-...-",
    "+" => ".-.-.",
    "@" => ".--.-."}
  
  # Some international characters not included in the ITU-R specification.
  International_extensions = {
    "ä" => ".-.-",
    "æ" => ".-.-",
    "ą" => ".-.-",
    "à" => ".--.-",
    "å" => ".--.-",
    "ç" => "-.-..",
    "ĉ" => "-.-..",
    "ć" => "-.-..",
    "š" => "----",
    "ĥ" => "----",
    "ð" => "..--.",
    "ś" => "...-...",
    "è" => ".-..-",
    "ł" => ".-..-",
    "é" => "..-..",
    "đ" => "..-..",
    "ę" => "..-..",
    "ĝ" => "--.-.",
    "ĵ" => ".---.",
    "ź" => "--..-.",
    "ñ" => "--.--",
    "Ñ" => "--.--",
    "ń" => "--.--",
    "ö" => "---.",
    "ø" => "---.",
    "ó" => "---.",
    "ŝ" => "...-.",
    "þ" => ".--..",
    "ü" => "..--",
    "ŭ" => "..--",
    "ż" => "--..-"
  }

  # The space between morse words is seven spaces.
  Space_between_words = {" " => "       "}

  # Default dot signal: '.'
  DOT = '.'
  
  # Default dot signal: '-'
  DASH = '-'
  
  # Character mapping to write morse code.
  LETTERS_TO_MORSE = Space_between_words.merge(International_extensions).merge(ITU_Morse)
  
  # Character mapping to read morse code.
  MORSE_TO_LETTERS = (Space_between_words.merge(ITU_Morse)).invert
  
  MORSE_TO_LETTERS.default = ""
  LETTERS_TO_MORSE.default = ""
  
  # Prosign for 'Error'
  Error = "........"
  
  # Prosign for 'Understood'
  Understood = "...-."
  
  # Prosign for 'Invitation to transmit'
  Invitation_to_transmit = "-.-"
  
  # Prosign for 'Wait'
  Wait = ".-..."
  
  # Prosign for 'End of work'
  End_of_work = "...-.-"
  
  # Prosign for 'Starting signal'
  Starting_signal = "-.-.-"
  
end