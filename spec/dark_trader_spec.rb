require_relative '../lib/dark_trader'

describe "Est ce un array ?!" do
  describe "class" do
    it "should echo array" do
      expect(crypto_symbol_list.class).to eq(Array)
    end
  end
  describe "length" do
    it "should echo the array size 1" do
      expect(crypto_symbol_list.length).to eq(200)
    end
    it "should echo the array size 2" do
      expect(crypto_price_list.length).to eq(200)
    end
  end
  describe "Is there a Bitcoin here ?!" do
    it "should echo the truth" do
      expect(crypto_symbol_list).to include("BTC")
    end
  end
end