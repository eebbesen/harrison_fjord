require 'test_helper'

describe Redis::Store::VERSION do
  it 'returns current version' do
    Redis::Store::VERSION.must_equal '1.1.7'
  end
end
