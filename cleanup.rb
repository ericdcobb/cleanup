require 'date'
system("clear")

clean_directory =  "#{ARGV[0]}/**/*".gsub("\\","/" )
extension = ""

if ARGV[1].start_with? "." 
	extension = ARGV[1] 
else 
	extension = ".#{ARGV[1]}"
end

min_file_size = ARGV[2].to_i

max_age = ARGV[3].to_i
delete_date = DateTime.now - max_age

file_count = 0
total_bytes_to_clean = 0

dry_run = ARGV[4].eql? "dry"

entries = Dir.glob(clean_directory)
entries.each do |item|
	next if item.eql? '.' or item.eql? '..'
	next if File.directory? item or File.extname(item).casecmp(extension) != 0
	next if (File.size? item) < min_file_size
	next if ( DateTime.parse( (File.mtime item).to_s ) )> delete_date

	file_count = file_count + 1
	total_bytes_to_clean = total_bytes_to_clean + ( File.size? item )

	puts "File Name: #{item} " 
	puts "File Size: #{ File.size? item} "
	if !dry_run
		File.delete item
	end
end

total_gigs =  9.31323e-10 * total_bytes_to_clean

puts "Cleaned #{file_count} files to save #{total_gigs} gigs."
if dry_run
	puts "(dry run)"

end