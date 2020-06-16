require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    x = Nokogiri::HTML(open(index_url))
    cards = x.css('.student-card')
    student_array = []
    cards.each do |card|
      name = card.css('.student-name').text 
      location = card.css('.student-location').text 
      profile_url = card.css('a')[0]["href"]

      student_hash = {}
      student_hash[:name] = name 
      student_hash[:location] = location
      student_hash[:profile_url] = profile_url
      
      student_array << student_hash
      
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    socials = page.css(".social-icon-container")
    info_hash = {}
    socials.each do |social|
      twitter = social.css('a')[0]["href"]
      linkedin = social.css('a')[1]["href"]
      
      
      
      info_hash[:twitter] = social_link
    end
    info_hash
    
  end

end


