require_relative '../lib/mairie_christmas'


describe "Est ce un array ?!" do
  describe "class" do
    it "should echo array" do
      expect(get_city_list).to eq(Array)
    end
  end
  describe "length" do
    it "should echo the array size 1" do
      expect(@city_list.length).to eq(200)
    end
    it "should echo the array size 2" do
      expect(@city_mail.length).to eq(200)
    end
  end
  describe "Is there a Bitcoin here ?!" do
    it "should echo the truth" do
      expect(get_city_list).to include("ermont")
    end
  end
end