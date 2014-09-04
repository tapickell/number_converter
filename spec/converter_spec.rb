require 'converter'

TEST_BINARY = '1111000011110000'
TEST_DECIMAL = 42
TEST_HEXADECIMAL = "E5B6AED7"
TEST_FIFTEEN = 15
TEST_TWENTY_TWO = 22
TEST_TEN = 10
TEST_NEGATIVE = -15

describe Number do
  it "takes a binary number string then can return a decimal" do
    @number = Number.new(TEST_BINARY)
    expect { @number.type == "binary" }
    expect { @number.to_decimal == 61680 }
  end

  it "takes a hexadecimal number string then can return a decimal" do
    @number = Number.new(TEST_HEXADECIMAL)
    expect { @number.type == "hexadecimal" }
    expect { @number.to_decimal == 3853954775 }
  end

  it "takes an integer then can return a binary number string" do
    @number = Number.new(TEST_DECIMAL)
    expect { @number.type == "decimal" }
    expect { @number.to_binary == "101010" }
  end

  it "takes an integer then can return a hexadecimal number string" do
    @number = Number.new(TEST_DECIMAL)
    expect { @number.type == "decimal" }
    expect { @number.to_hexadecimal == "2a" }
  end

  it "takes an integer then can return a hexadecimal number string for other values" do
    @number1 = Number.new(TEST_FIFTEEN)
    expect { @number1.type == "decimal" }
    expect { @number1.to_hexadecimal == "f" }

    @number2 = Number.new(TEST_TWENTY_TWO)
    expect { @number2.type == "decimal" }
    expect { @number2.to_hexadecimal == "16" }

    @number3 = Number.new(TEST_TEN)
    expect { @number3.type == "decimal" }
    expect { @number3.to_hexadecimal == "a" }
  end

  it "takes a negative integer then can return a hexadecimal number string" do
    @number = Number.new(TEST_NEGATIVE)
    expect { @number.type == "decimal" }
    expect { @number.to_hexadecimal == "-f" }
  end
end
