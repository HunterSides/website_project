require_relative 'website_project/version'
require_relative 'website_project/cli'
require_relative 'website_project/scraper'
require_relative 'website_project/website'

require 'pry'
require 'nokogiri'
require 'open-uri'




module WebsiteProject
  class Error < StandardError; end
  # Your code goes here...
end
