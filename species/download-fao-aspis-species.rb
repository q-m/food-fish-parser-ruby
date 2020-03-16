#!/usr/bin/env ruby
#
# Download FAO's ASFIS list and output all fish/marine species
#
require 'open-uri'
require 'zip'
require 'csv'

ZIP_URL = 'http://www.fao.org/fishery/static/ASFIS/ASFIS_sp.zip'

open(ZIP_URL) do |buffer|
  Zip::File.open_buffer(buffer) do |zip|
    zip.glob('*.txt').each do |entry|
      CSV.new(entry.get_input_stream, headers: true).each do |row|
        puts row['Scientific_name']
      end
    end
  end
end
