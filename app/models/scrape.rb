class Scrape 
  attr_accessor :title, :hotness, :image_url, :synopsis, :rating, :genre, :director, :release_date,
                :runtime

  def scrape_movie(url)
      page = Nokogiri::HTML(open(url))
      self.title = page.at('h1[@itemprop="name"]').text
      self.hotness = page.at('span[@itemprop="ratingValue"]').text.to_i
      self.image_url = page.at_css('#poster_link img')['src']
      self.synopsis = page.at_css('#movieSynopsis').text.tidy_bytes
      self.rating = page.at('td[@itemprop="contentRating"]').text
      self.genre = page.at('span[@itemprop="genre"]').text
      self.director = page.at('span[@itemprop="name"]').text
      self.runtime = page.at('time[@itemprop="duration"]').text
  end
end