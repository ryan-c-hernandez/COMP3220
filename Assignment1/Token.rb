#
# Class Token - Encapsulates the tokens in TINY
#
# @type - the type of token
# @text = the text of the token
class Token
 attr_accessor :type
 attr_accessor :text

 # Token Class Constants
 EOF = "eof"
 LPAREN = "("
 RPAREN = ")"
 ADDOP = "+"
 WS = "whitespace"
 # ... more needed here

 # Constructor
 def initialize(type,text)
 @type = type
 @text = text
 end
 #
 def to_s
 return "[Type: " + @type + " Text: " + @text + " ]"
 end
end
