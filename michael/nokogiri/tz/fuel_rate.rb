require 'nokogiri'
require 'open-uri'

class FuelRate
  def initialize(url)
    resource = open(url)
    @doc = Nokogiri::HTML(resource)
  end
  
  def fetch_us_neweset_fuel_rate(region)
    @doc.css("td.DataStub").each do |datastub|

      if datastub.css("td.DataStub1").inner_html == region
        return datastub.parent().css("td.Current2").inner_html
      end
    end
  end

end