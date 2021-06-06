require './lib/auto.rb'
require './lib/tablero.rb'
require './lib/obstaculo.rb'

RSpec.describe "Pruebas para las nuevas fucionalidades" do
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 3 balas" do
        expect(Auto.new('N',2,1,3).getBalas).to eq 3 
    end
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 5 balas" do
        expect(Auto.new('N',2,1,5).getBalas).to eq 5 
    end
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 5 balas pero se le resta 1 bala" do
        auto=Auto.new('N',2,1,5)
        auto.setBalas(5-1)
        expect(auto.getBalas).to eq 4 
    end
    it "Deberia devolver la cantidad de balas del auto si el auto tiene 3 balas pero se le resta 1 bala" do
        auto=Auto.new('N',2,1,3)
        auto.setBalas(3-1)
        expect(auto.getBalas).to eq 2 
    end
    it "Deberia devolver la cantidad de balas del auto <3> si el auto tiene 3 balas y no se topa con un obstaculo" do
        auto=Auto.new('E',2,1,3)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        expect(auto.getBalas).to eq 3
    end
    it "Deberia devolver la cantidad de balas del auto <2> si el auto tiene 3 balas y si se topa con un obstaculo" do
        auto=Auto.new('N',2,1,3)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getBalas).to eq 2
    end
    it "Deberia devolver la posicion final en Y <1> si el auto tiene 3 balas y si se topa con un obstaculo en 1,1" do
        auto=Auto.new('N',2,1,3)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_y).to eq 1
    end
    it "Deberia devolver la posicion final en Y <2> si el auto tiene 0 balas y si se topa con un obstaculo en 1,1" do
        auto=Auto.new('N',2,1,0)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_y).to eq 2
    end
end