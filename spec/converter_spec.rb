require 'converter'

TEST_BINARY = '1111000011110000'
TEST_DECIMAL = 61680
TEST_HEXADECIMAL = "E5B6AED7"

describe Number do
  it "takes a binary number string then can return a decimal" do
    @number = Number.new(TEST_BINARY)
    @number.type.should == "binary"
    @number.to_decimal.should == 61680
  end

  it "takes a hexadecimal number string then can return a decimal" do
    @number = Number.new(TEST_HEXADECIMAL)
    @number.type.should == "hexadecimal"
    @number.to_decimal.should == 3853954775
  end

  it "takes an integer then can return a binary number string" do
    @number = Number.new(TEST_DECIMAL)
    @number.type.should == "decimal"
    @number.to_binary.should == "1111000011110000"
  end

  it "takes an integer then can return a hexadecimal number string" do
    @number = Number.new(TEST_DECIMAL)
    @number.type.should == "decimal"
    @number.to_hexadecimal.should == "F0F0"
  end
end
