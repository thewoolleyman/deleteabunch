#!/usr/bin/env ruby

# Delete a bunch of files/dirs when there's too many for the unix shell to handle via a glob and the find command syntax ain't working for you

delete_glob = '/tmp/Jetty*'
exclude_glob = '/tmp/Jetty__8985__solr_62315'

delete_paths = Dir.glob(delete_glob)
exclude_paths = Dir.glob(exclude_glob)

delete_paths -= exclude_paths

p "Paths to delete:"
p delete_paths

p "Paths to exclude:"
p exclude_paths

delete_paths.each do |path|
  p "rm -rf #{path}"
  `rm -rf #{path}`
end