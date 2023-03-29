require 'watir'
require 'nokogiri'

# TODO: make language dynamic, currently only Ruby

# Get URL from command line argument
url = ARGV.first

# Open a browser window silently and go to the URL using Watir
browser = Watir::Browser.new :chrome, headless: true
browser.goto(url)

# Parse the HTML using Nokogiri
html = Nokogiri::HTML.parse(browser.html)

# Pass relevant content to variables
title = html.search('h4')[0].text
description = html.search('#description').text

# Code is read line by line
code = ''
html.search('.CodeMirror-code')[0].search('.CodeMirror-line').each { |line| code += "#{line.text}\n" }

# Create filename from title
def filename(text)
  "#{Time.now.strftime('%y%m%d')}_#{text.downcase.scan(/\w+/).join('_')}.rb"
end

# Write file (or append if existing, safety measure)
file = File.new(filename(title), 'a')
file.write("#{title}\n#{url}\n\n#{description}\n\n#{code}")
file.close