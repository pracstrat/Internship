require 'open-uri'
require 'hpricot'
class ExtractTheHtml
  def convert(one_html)
    one_html.match(%r{"(.*?)"}m)[1] +":" + one_html.match(%r{">(.*?)</a>}m)[1] 
  end
  
  def open_address_and_title(address)
    page = Hpricot(open(address))
    page.at(:title).inner_html
  end  
end 
