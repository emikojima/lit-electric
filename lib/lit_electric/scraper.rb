require 'pry'
class Scraper

  def self.scrape_from_url
  book_hash = {}
  @books = []
  all_desc = []
  doc = Nokogiri::HTML(open("https://electricliterature.com/48-books-by-women-and-nonbinary-authors-of-color-to-read-in-2019"))

    doc.css("#article-main-18314 section").map do |x|
      book_hash = {
       # title: x.css("h4 em").map{|x| x.text},
       url: x.css(".wp-block-image a").map {|a| a.attribute("href").text},
       title_and_authors: x.css("h4").map{|x| x.text},
       description: x.css("h4+p").map{|x| x.text}
      }
      @books << book_hash unless book_hash[:title_and_authors].empty? == true || @books.include?(book_hash)
    end
    @books
  end

  def self.urls
    @books[0][:url]
  end

  def self.title_and_authors
    @books[0][:title_and_authors]
  end

  def self.description
    @books[0][:description]
  end

end
