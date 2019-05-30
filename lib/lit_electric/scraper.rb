require 'pry'
class Scraper

  def self.scrape_from_url
  book_hash = {}
  books = []
  all_desc = []
  doc = Nokogiri::HTML(open("https://electricliterature.com/48-books-by-women-and-nonbinary-authors-of-color-to-read-in-2019"))

    doc.css("#article-main-18314 section").map do |x|
      book_hash = {
       title: x.css("h4 em").map{|x| x.text},
       url: x.css(".wp-block-image a").map {|a| a.attribute("href").text}
      }
      books << book_hash unless book_hash[:title].empty? == true || books.include?(book_hash)
    end

      # all_desc = doc.css("#article-main-18314").map do |x|
      # all_desc << x.text
      # end
    # titles = book_hash[:title].each do |book|
    # end
    # urls = book_hash[:url].each do |book|
    # end

    # books[:urls] << urls
    books


  end
end
