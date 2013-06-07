clean_directory =  "#{ARGV[0]}/**/*".gsub("\\","/" )
extension = ""

if ARGV[1].start_with? "." 
	extension = ARGV[1] 
else 
	extension = ".#{ARGV[1]}"
end

min_file_size = ARGV[2].to_i

entries = Dir.glob(clean_directory)

entries.each do |item|
	next if item.eql? '.' or item.eql? '..'
	next if File.directory? item or File.extname(item).casecmp(extension) != 0
	next if (File.size? item) < min_file_size
	puts "File Name: #{item} " 
	puts "File Size: #{ File.size? item} "
end