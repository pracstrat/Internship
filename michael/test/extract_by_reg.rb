require "open-uri"
url = "https://github.com/explore"

source = open(url).read
# count = 0
# source.each_line{
# 	|line|
# 	links = line.scan(/<a.+?href="(.+?)"/)

# 	contents= line.scan(/<a.+?>(.+?)<\/a>/)
# 	if links !=[] or contents !=[]

# 		p "#{count} : #{line.scan(/<a.+?href="(.+?)"/)} #{line.scan(/<a.+?>(.+?)<\/a>/)} "
# 		count+=1
# 	end
	
# }
links = source.scan(/<a.+?href="(.+?)".*?>/)

contents= source.scan(/<a.+?>(.+?)<\/a>/)

puts "--- FOUND THIS MANY LINKS ---"
puts links.size

puts "--- PRINTING LINKS ---"
links.each do |link|
  puts "- #{link.join}"
end


puts "--- FOUND THIS MANY LINKS ---"
puts contents.size
puts "---PRINTING contents ---"
contents.each do |content|
	puts "- #{content.join}"
end