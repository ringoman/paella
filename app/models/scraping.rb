class Scraping
  def self.restaurant_urls
    puts 'getだぜ'
    agent = Mechanize.new
    page = agent.get("https://tabelog.com/tokyo/A1303/A130301/R4698/rstLst/?SrtT=rt&svd=20161031&svt=1900&svps=2&Srt=D&sort_mode=1")
    elements=page.search('.list-rst.is-blocklink')
    puts elements.length
    elements.each do |ele|
      name= ele.search('.list-rst__rst-name-target.cpy-rst-name').inner_text
      img= ele.at('.list-rst__photo-item .list-rst__image-target img').get_attribute('data-original')
      res=Restaurant.new(name: name,image: img)
      res.save
    end
  end


  def self.get_restraurant(link)
  end

  def self.ima
    puts 'test'
  end

end
