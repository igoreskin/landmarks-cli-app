class Landmarks::CLI

  def call
    puts "Welcome to Top 20 St. Petersburg Architectural Landmarks!"
    scraper = Landmarks::Scraper.new
    scraper.print_the_title
    scraper.scrape_landmarks_index
    puts ""
    scraper.print_landmarks_index
    puts ""
    start
  end

  def start
    puts "Please enter the number of the landmark you would like more information on:"
    input = gets.strip
  end


end
