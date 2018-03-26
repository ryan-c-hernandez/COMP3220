load "TinyToken.rb"
load "TinyScanner.rb"

# filename.txt below is simply the "source code"
# that you write that adheres to your grammar rules
# if it is in the same directory as this file, you can
# simply include the file name, otherwise, you will need
# to specify the entire path to the file as we did above
# to load the other ruby modules
scan = Scanner.new("input.txt")
tok = scan.nextToken()
while (tok.get_type != Token::EOF) #tok.get_type()

   puts "Token: #{tok} type: #{tok.get_type()}"
   tok = scan.nextToken()
end
puts "Token: #{tok} type: #{tok.get_type()}"
