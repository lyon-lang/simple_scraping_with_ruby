require 'open-uri'
require 'nokogiri'
require 'csv'

    def scraping(url)
        html = URI.open("#{url}").read
        nokogiri_doc = Nokogiri::HTML(html)
        final_array = []

        nokogiri_doc.search(".menu-item").each do |element|
            element = element.text
            final_array << element
        end
        
        final_array.each_with_index do |element, index|
            puts "#{index + 1} - #{element}"
        end
        return final_array

    end

scrape = scraping('https://www.kojoyankson.com/')

filepath = "scrape.csv"


CSV.open(filepath, 'wb') do |csv|
    csv << ['title', 'index']
    scrape.each_with_index do |item, index|
        csv << [item, index]
    end
end