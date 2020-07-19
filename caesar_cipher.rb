require 'pry'

def caesar_cipher(string, shift)
  chars = string.downcase.split("")
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
      if position + shift > 0 && position + shift <= 26
        new_position = position + shift
        new_positions.push(new_position)
      elsif position + shift <= 0
        remainder = shift.abs - position.abs
        new_position = 26 - remainder.abs
        new_positions.push(new_position)
        remainder = 0
      else
        remainder = 27 - position
        fixed_shift = shift - remainder
        new_position = remainder + fixed_shift
        new_positions.push(new_position)
        remainder = 0
        fixed_shift = 0
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
  p cipher
  return cipher
end

puts "Enter a phrase to encrypt: "
string = gets.chomp.to_s
puts "Enter a number to adjust the encryption: "
shift = gets.chomp.to_i

caesar_cipher(string, shift)
