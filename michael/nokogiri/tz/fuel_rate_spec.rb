require_relative "fuel_rate"
describe FuelRate do 


  describe "fetch_us_neweset_fuel_rate" do


    let!(:url) { "http://www.eia.gov/dnav/pet/pet_pri_gnd_a_epd2d_pte_dpgal_w.htm" }
    let!(:fuelrate) { FuelRate.new(url) }

    context "description" do
      let!(:region) { "Midwest (PADD 2)" }
      it "should return the newest region's rate" do

      fuelrate.fetch_us_neweset_fuel_rate(region).should  == "3.866"


    end
    end
    

  end

end