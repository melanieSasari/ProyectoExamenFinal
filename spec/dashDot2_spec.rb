require './lib/auto.rb'
require './lib/tablero.rb'
require './lib/obstaculo.rb'
require './lib/pisoResbaladizo.rb'
require './lib/puente.rb'

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
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getBalas).to eq 2
    end
    it "Deberia devolver la posicion final en Y <1> si el auto tiene 3 balas y si se topa con un obstaculo en 1,1" do
        auto=Auto.new('N',2,1,3)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getPosicion_y).to eq 1
    end
    it "Deberia devolver la posicion final en Y <2> si el auto tiene 0 balas y si se topa con un obstaculo en 1,1" do
        auto=Auto.new('N',2,1,0)
        auto.addComando("A")
        tablero=Tablero.new(3,3)
        obstaculo=Obstaculo.new(1,1)
        tablero.addAuto(auto)
        tablero.addObstaculo(obstaculo)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
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
    it "Deberia devolver true si creamos el piso con posiciones y desvio <1,2,D> y a??adimos al tablero" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"D")
        tablero=Tablero.new(3,3)
        expect(tablero.addPisoResbaladizo(pisoResvaladizo)).to eq true
    end
    it "Deberia devolver el piso resvaladizo si creamos el piso con posiciones y desvio <1,2,D> y a??adimos al tablero" do
        pisoResvaladizo=PisoResvaladizo.new(1,2,"D")
        tablero=Tablero.new(3,3)
        tablero.addPisoResbaladizo(pisoResvaladizo)
        expect(tablero.getPisosResbaladizos[0]).to eq pisoResvaladizo
    end
    it "Deberia devolver la nueva orientacion del auto('S',0,1,3) si creamos el piso con posiciones y desvio <1,2,D> y a??adimos al tablero" do
        pisoResvaladizo=PisoResvaladizo.new(1,1,"D")
        tablero=Tablero.new(3,3)
        auto=Auto.new('S',0,1,3)
        auto.addComando("A")
        tablero.addPisoResbaladizo(pisoResvaladizo)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getOrientacion).to eq "O"
    end
    it "Deberia devolver la nueva orientacion del auto('S',0,1,3) si creamos el piso con posiciones y desvio <1,2,I> y a??adimos al tablero" do
        pisoResvaladizo=PisoResvaladizo.new(1,1,"I")
        tablero=Tablero.new(3,3)
        auto=Auto.new('S',0,1,3)
        auto.addComando("A")
        tablero.addPisoResbaladizo(pisoResvaladizo)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getOrientacion).to eq "E"
    end
    it "Deberia devolver la misma orientacion del auto('E',0,1,3) si creamos el piso con posiciones y desvio <1,2,D> y a??adimos al tablero" do
        pisoResvaladizo=PisoResvaladizo.new(1,1,"D")
        tablero=Tablero.new(3,3)
        auto=Auto.new('E',0,1,3)
        auto.addComando("A")
        tablero.addPisoResbaladizo(pisoResvaladizo)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getOrientacion).to eq "E"
    end
    it "Deberia devolver la posicion en y <0> del inicio del puente si creamos el puente con posiciones yInicio,xInicio yFinal,xFinal<0,2 2,2>" do
        puente=Puente.new(0,2,2,2)
        expect(puente.getPosInicio_y).to eq 0
    end
    it "Deberia devolver la posicion en x <2> del inicio del puente si creamos el puente con posiciones yInicio,xInicio yFinal,xFinal<0,2 2,2>" do
        puente=Puente.new(0,2,2,2)
        expect(puente.getPosInicio_x).to eq 2
    end
    it "Deberia devolver la posicion en y <2> del fin del puente si creamos el puente con posiciones yInicio,xInicio yFinal,xFinal<0,2 2,2>" do
        puente=Puente.new(0,2,2,2)
        expect(puente.getPosFin_y).to eq 2
    end
    it "Deberia devolver la posicion en x <2> del fin del puente si creamos el puente con posiciones yInicio,xInicio yFinal,xFinal<0,2 2,2>" do
        puente=Puente.new(0,2,2,2)
        expect(puente.getPosFin_x).to eq 2
    end
    it "Deberia devolver true si creamos el puente con posiciones de inicio y fin <0,2 2,2> y a??adimos al tablero" do
        puente=Puente.new(0,2,2,2)
        tablero=Tablero.new(3,3)
        expect(tablero.addPuente(puente)).to eq true
    end
    it "Deberia devolver el puente si creamos el puente con posiciones de inicio y fin <0,2 2,2> y a??adimos al tablero" do
        puente=Puente.new(0,2,2,2)
        tablero=Tablero.new(3,3)
        tablero.addPuente(puente)
        expect(tablero.getPuentes[0]).to eq puente
    end
    it "Deberia devolver la nueva posicion en y del auto('E',0,1,3) si creamos el puente con posiciones de inicio y fin <0,2 2,2> y a??adimos al tablero" do
        puente=Puente.new(0,2,2,2)
        tablero=Tablero.new(3,3)
        auto=Auto.new('E',0,1,3)
        tablero.addPuente(puente)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getPosicion_y).to eq 2
    end
    it "Deberia devolver la nueva posicion en y del auto('E',0,1,3) si creamos el puente con posiciones de inicio y fin <0,2 2,2> y a??adimos al tablero" do
        puente=Puente.new(0,1,2,1)
        tablero=Tablero.new(3,3)
        auto=Auto.new('E',0,0,3)
        tablero.addPuente(puente)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos,tablero.getPisosResbaladizos,tablero.getPuentes)
        expect(auto.getPosicion_x).to eq 1
    end
end