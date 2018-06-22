require "unirest"

system "clear"

puts "Welcome to Terminal Reddit!"
puts
print "What subreddit do you want to visit? "
sub_reddit = gets.chomp

visit_sub_reddit = Unirest.get("https://www.reddit.com/r/#{sub_reddit}/.json")

look_up = visit_sub_reddit.body


if look_up["message"] == "Not Found"
  puts "This is not a subreddit!"
else 
  puts JSON.pretty_generate(visit_sub_reddit.body)
end


#To work on: 

# puts "Which post do you want to see comments from? Select Number: "
# number = gets.chomp.to_i

# comments = Unirest.get("https://www.reddit.com/r/#{sub_reddit}/comments/.json")
# reddit_comments = comments.body

# puts JSON.pretty_generate(visit_sub_reddit.body["children"][number]["permalink"])

# p visit_sub_reddit[1]["children"]