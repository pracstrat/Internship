class Convert
   A = IO.readlines("file.txt")

  def getpostion(line_num,column_num)
    b , c = line_num - 1,column_num - 1 
    A[b][c]  
  end

  def transpose(column_num)
    b = column_num - 1
    A[0][b] + A[1][b] + A[2][b]    
  end  
           
end

describe Convert do
    before :each do 
      @convert = Convert.new    
    end
  it "get postion "  do
    @convert.getpostion(1,1).should == "A"
    @convert.getpostion(3,1).should == "!"
  end
  
  it "transpose to we need" do 
    @convert.transpose(2).should == "B2@" 
  end

end    