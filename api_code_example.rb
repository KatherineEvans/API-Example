continue = ""
until continue == "N" do

  require "unirest"

  system "clear"
  puts "Welcome to the Dictionary App!"
  puts 
  print "Please enter your word: "
  word = gets.chomp

  def_response = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
  ex_response = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/examples?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
  pro_response = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

  word_information = def_response.body
  word_example = ex_response.body
  word_pronunciation = pro_response.body

  definition = word_information[0]["text"]
  example = word_example["examples"][0]["text"]
  pronunciation = word_pronunciation[0]["raw"]


  puts "The definition of #{word} is:  #{definition}"
  puts 
  puts "Looking for an example? Glad you asked: #{example}"
  puts 
  puts "Here is how to pronounce the word: #{pronunciation}"
  puts 


  print "Would you like to look up another word? Enter Y or N: "
  continue = gets.chomp

end
