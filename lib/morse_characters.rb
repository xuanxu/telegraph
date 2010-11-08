# encoding: UTF-8
module MorseCharacters
  
  # RECOMMENDATION ITU-R M.1677: International Morse code
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

  Space_between_words = {" " => "       "}

  Dot = '.'
  Dash = '-'
  LETTERS_TO_MORSE = Space_between_words.merge(International_extensions).merge(ITU_Morse)
  MORSE_TO_LETTERS = (Space_between_words.merge(ITU_Morse)).invert
  
  MORSE_TO_LETTERS.default = ""
  LETTERS_TO_MORSE.default = ""
  
  Error = "........"
  Understood = "...-."
  Invitation_to_transmit = "-.-"
  Wait = ".-..."
  End_of_work = "...-.-"
  Starting_signal = "-.-.-"
end