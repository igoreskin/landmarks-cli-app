require 'pry'
require 'nokogiri'
require 'open-uri'

class Landmarks::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.saint-petersburg.com/top-20-attractions/"))
  end

  def scrape_landmarks_index
    landmarks_index = []
    self.get_page.css("h2").each { |el| landmarks_index << el.text }
    landmarks_index
  end

  def print_the_title
    puts self.get_page.css("h1").text
  end

  def print_landmarks_index
    scrape_landmarks_index.each.with_index { |el, index| puts "#{index+1}.\t #{el}" }
    nil
  end

  def get_landmark_page(url)
    Nokogiri::HTML(open(url))
  end


end
