load "TinyToken.rb"
load "TinyScanner.rb"

# Test for Token Class

#EOF token
tok = Token.new(Token::EOF, "eof")
puts "Token type: #{tok.type}"
puts "Token text: #{tok.text}"

#LPAREN token
tok = Token.new(Token::LPAREN, "(")
puts "Token type: #{tok.type}"
puts "Token text: #{tok.text}"

#RPAREN token
tok = Token.new(Token::RPAREN, ")")
puts "Token type: #{tok.type}"
puts "Token text: #{tok.text}"

#Change type/text
tok.type = "ADDOP"
tok.text = "+"
puts "Token type: #{tok.type}"
puts "Token text: #{tok.text}"

puts "Token: #{tok}"

# TinyScanner Tests

#Nonexisting File test
scan = Scanner.new("nonexistingfile.txt")
#Should end gracefully and give an error message

#Existing file Tests
scan = Scanner.new("input.txt")
#If exists test program will not exit.
