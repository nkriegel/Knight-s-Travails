require 'kt'

describe KT, "how input is validated" do
  it "throws an exception if any parameter has more than 2 characters" do
    expect {KT.new 'x12', 'a1'}.to raise_exception
    expect {KT.new 'a1', 'k12'}.to raise_exception
    expect {KT.new 'a1', 'a1', ['k12']}.to raise_exception
  end  
  
  it "throws an exception if any parameter has less than 2 characters" do
    expect {KT.new 'x', 'a1'}.to raise_exception
    expect {KT.new 'a1', 'x'}.to raise_exception
    expect {KT.new 'a1', 'a1', ['x']}.to raise_exception
  end  
  
  it "throws an exception if any parameter is not a valid chess board position" do
    expect {KT.new 'k2', 'a1'}.to raise_exception
    expect {KT.new 'a1', 'k2'}.to raise_exception
    expect {KT.new 'a1', 'a1', ['k2']}.to raise_exception
    expect {KT.new 'b0', 'a1'}.to raise_exception
    expect {KT.new 'a1', 'b9'}.to raise_exception
    expect {KT.new 'a1', 'a1', ['b0']}.to raise_exception
  end
  
  it "throws an exception if any parameter is not a string" do
    expect {KT.new 7, 'a1'}.to raise_exception
    expect {KT.new 'a1', ['k2']}.to raise_exception
    expect {KT.new 'a1', 'a1', [{'k2' => 5}]}.to raise_exception
  end
end
