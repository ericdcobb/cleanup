
entries = Dir.glob("#{ARGV[0]}/**/*")

entries.each do |item|
	next if item.eql? '.' or item.eql? '..' or File.directory? item
	puts "#{item} | #{ File.size? item}" 
end