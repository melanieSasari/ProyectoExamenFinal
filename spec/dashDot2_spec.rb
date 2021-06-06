require './lib/auto.rb'
RSpec.describe "Pruebas para las nuevas fucionalidades" do
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 3 balas" do
        expect(Auto.new('N',2,1,3).getBalas).to eq 3 
    end
end