require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'website_project/version'
require_relative 'website_project/cli'
require_relative 'website_project/scraper'
require_relative 'website_project/website'
module WebsiteProject
  class Error < StandardError; end
  # Your code goes here...
end
