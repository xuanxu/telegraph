# Telegraph

Telegraph is a Ruby gem that provides straightforward text-to-morse and morse-to-text translators

It uses as reference the document ['RECOMMENDATION ITU-R M.1677'](https://www.itu.int/rec/R-REC-M.1677-1-200910-I) from the International Telecommunication Union, Radiocommunication Sector (ITU-R), the United Nations agency for information and communication technology issues.

[![Build Status](https://github.com/xuanxu/telegraph/actions/workflows/tests.yml/badge.svg)](https://github.com/xuanxu/telegraph/actions/workflows/tests.yml)
[![Gem Version](https://badge.fury.io/rb/telegraph.svg)](https://badge.fury.io/rb/telegraph)

## Getting started

Install the gem:

```
$ gem install telegraph
```

Then depending on your project you may:

require the gem (if a ruby project):

```ruby
    require 'telegraph'
```

or add it to your Gemfile:

```ruby
    gem 'telegraph', :git => 'git://github.com/xuanxu/telegraph.git'
```

## Usage

The simplest way to read or write morse code is using directly the two methods defined in Telegraph:

```ruby
# Converts text to morse characters:
Telegraph.text_to_morse("Hello world")  #=> ".... . .-.. .-.. ---       .-- --- .-. .-.. -.."

# Reads morse characters into text:
Telegraph.morse_to_text(".... . .-.. .-.. ---       .-- --- .-. .-.. -..")  #=> hello world"
```

In the Telegraph module you will find defined also the most commonly used prosigns:

```ruby
# Error sign:
Telegraph::Error    #=> "........"

#The complete list of prosigns:
Telegraph::Error
Telegraph::Understood
Telegraph::Invitation_to_transmit
Telegraph::Wait
Telegraph::End_of_work
Telegraph::Starting_signal
```

All the generated morse code will use the character '.' as short signal (aka dot) and the character '-' as long signal (aka dash).

If you need to write or read using different characters as short and long signals you can do it instantiating your own `Telegraph::MorseTransmission` class:

```ruby
# User defined dot & dash (:short and :long defaults to '.' and '-')
morser = Telegraph::MorseTransmission.new(:short =>'x', :long => '3')
```

and then using the methods to read/write:

```ruby
# write morse code with custom signals
morser.text_to_morse("Hello world")  #=> "xxxx x x3xx x3xx 333       x33 333 x3x x3xx 3xx"

# read morse code with custom signals
morser.morse_to_text("xxxx x x3xx x3xx 333       x33 333 x3x x3xx 3xx")  #=> hello world"
morser.error    #=> "xxxxxxxx"
```

== Credits

Author:: Juanjo Bazán
Copyright:: Copyright (c) 2013 - ∞ Juanjo Bazán
License:: Released under the MIT license.

