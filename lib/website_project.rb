require_relative 'website_project/version'
require_relative 'website_project/cli'
require_relative 'website_project/scraper'
require_relative 'website_project/options'
require_relative 'website_project/info'

require 'pry'
require 'nokogiri'
require 'open-uri'

module WebsiteProject
  class Error < StandardError; end
  # Your code goes here...
end
