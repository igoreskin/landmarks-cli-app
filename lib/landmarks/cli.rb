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
    input = gets.chomp.to_i
    landmark = Landmarks::Landmark.find(input)
    puts "\t\n"
    puts landmark.name.strip
    puts "\t\n"
    puts "\t\t\t\t\t\t================== Description of the Landmark =================="
    puts "\t\n"
    puts landmark.description


  end


end
