require './lib/auto.rb'
RSpec.describe "Pruebas para las nuevas fucionalidades" do
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 3 balas" do
        expect(Auto.new('N',2,1,3).getBalas).to eq 3 
    end
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 5 balas" do
        expect(Auto.new('N',2,1,5).getBalas).to eq 5 
    end
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 5 balas pero se le resta -1" do
        auto=Auto.new('N',2,1,5)
        auto.setBalas(5-1)
        expect(auto.getBalas).to eq 4 
    end
end