require_relative 'spec_helper.rb'
require_relative '../lib/result.rb'
# collapse the log by date into an array of hashes
# containing one entry per day
describe Result do
  it 'collapse the log by date into an array of hashes' do
    log = [
            { time: 201_201, x: 2 },
            { time: 201_201, y: 7 },
            { time: 201_201, z: 2 },
            { time: 201_202, a: 3 },
            { time: 201_202, b: 4 },
            { time: 201_202, c: 0 }
          ]
    result = [
               { time: 201_201, x: 2, y: 7, z: 2 },
               { time: 201_202, a: 3, b: 4, c: 0 },
             ]
    Result.new.collapse_data_into_array(log).should == result
  end
end
