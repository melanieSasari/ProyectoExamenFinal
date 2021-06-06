require './lib/auto.rb'
require './lib/tablero.rb'
require './lib/obstaculo.rb'
require './lib/pisoResbaladizo.rb'

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
    it "Deberia devolver la posicion en y <1> del piso resvaladizo si creamos el piso con posiciones y,x <1,2>" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"I")
        expect(pisoResvaladizo.getPosicionPiso_y).to eq 1
    end
    it "Deberia devolver la posicion en x <2> del piso resvaladizo si creamos el piso con posiciones y,x <1,2>" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"I")
        expect(pisoResvaladizo.getPosicionPiso_x).to eq 2
    end
    it "Deberia devolver el desvio <I> del piso resvaladizo si creamos el piso con posiciones y desvio <1,2,I>" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"I")
        expect(pisoResvaladizo.getDesvio).to eq "I"
    end
    it "Deberia devolver el desvio <D> del piso resvaladizo si creamos el piso con posiciones y desvio <1,2,D>" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"D")
        expect(pisoResvaladizo.getDesvio).to eq "D"
    end
end