require 'net/http'
require 'uri'
require 'rexml/document'

class Hotpepper

  def self.test
    url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6948d6ea45b365f1&middle_area=Y030&free_drink=1&special=LU0004&count=20"))
    res = Net::HTTP.start(url.host, url.port){|http|
        http.get(url.path + "?" + url.query);
    }

    doc = REXML::Document.new(res.body)

    doc.elements.each('results/shop/') {|i|puts i.elements['name'].text}
  end

  def self.search1
    # puts 'search word!'
    # search_word = gets.chomp
    search_word="寿司"
    # search_word = search_word.gsub(/・/, " ")
        url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6948d6ea45b365f1&name=#{search_word}&count=20"))
    res = Net::HTTP.start(url.host, url.port){|http|
        http.get(url.path + "?" + url.query);
    }
        doc = REXML::Document.new(res.body)
    ht=[]
    doc.elements.each('results/shop/urls/') do |i| 
      ht << i.elements['pc'].text
    end
    return ht[0]
    
  end

    def self.search(search_word)
    # search_word = gets.chomp
    # search_word = search_word.gsub(/・/, " ")
        url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6948d6ea45b365f1&name=#{search_word}&middle_area=Y030&count=1"))
    res = Net::HTTP.start(url.host, url.port){|http|
        http.get(url.path + "?" + url.query);
    }
        doc = REXML::Document.new(res.body)
    ht=[]
    doc.elements.each('results/shop/urls/') do |i| 
      ht << i.elements['pc'].text
    end

    if ht.length == 0
      return ht
    end

    return ht[0]

  end
end