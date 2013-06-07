##Cleanup.rb

A stupid simple utility for cleaning out a directory.

Example usage:

	ruby cleanup.rb /Users/ericcobb/Desktop/test mov 1073741824 5

Will remove every file in the directory `/Users/ericcobb/Desktop/test` with the extension `mov` and larger that 1 gig, and older than 5 days.
