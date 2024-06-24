ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.

#rails serever起動に障害を起こすため、bootsnapをコメントアウト
# require "bootsnap/setup" # Speed up boot time by caching expensive operations.
