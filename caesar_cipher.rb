require 'pry'

def caesar_cipher(string, shift)
  chars = string.split("")
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  alphabet = alphabet.split("")
  alphabet_positions = {}
  i = 1
  alphabet.each do |letter|
    alphabet_positions[letter] = i
    i += 1
  end
  string_positions = []
  chars.each do |letter|
    if letter == ' '
      string_positions.push(' ')
    else
      position = alphabet_positions[letter]
      string_positions.push(position)
    end
  end
  new_positions = []
  string_positions.each do |position|
    if position == ' '
      new_positions.push(' ')
    else
      if new_position + shift > 0 && new_position + shift <= 26
        new_position = position + shift
        new_positions.push(new_position)
      elsif new_position + shift < 0
        #do this
      else
        #do this
      end
    end
  end
  cipher = []
  new_positions.each do |position|
    if position == ' '
      cipher.push(' ')
    else
      letter = alphabet_positions.key(position)
      cipher.push(letter)
    end
  end
  cipher = cipher.join("")
  binding.pry
  return cipher
end

caesar_cipher('cat dog', 2)
