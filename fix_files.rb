clean_directory =  "#{ARGV[0]}/**/*".gsub("\\","/" )

entries = Dir.glob(clean_directory)

entries.each do |item|
	next if item.eql? '.' or item.eql? '..' or File.directory? item
	puts "File Name: #{item} " 
	puts "File Size #{ File.size? item} "
end