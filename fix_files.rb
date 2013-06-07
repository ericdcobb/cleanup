clean_directory =  "#{ARGV[0]}/**/*".gsub("\\","/" )

entries = Dir.glob(clean_directory)

entries.each do |item|
	next if item.eql? '.' or item.eql? '..' or File.directory? item
	puts "#{item} | #{ File.size? item}" 
end