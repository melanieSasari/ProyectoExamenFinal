require './lib/auto.rb'
require './lib/tablero.rb'
require './lib/obstaculo.rb'

RSpec.describe "dash dot" do
    it "deberia devolver el la orientacion N del auto creado si le pasamos 'N' '1,2'" do
        expect(Auto.new('N',2,1,0).getOrientacion).to eq 'N' 
    end
    it "deberia devolver la posicion X 1 del auto creado si le pasamos 'N' 1,2" do
        expect(Auto.new('N',2,1,0).getPosicion_x).to eq 1 
    end
    it "deberia devolver la posicion Y 2 del auto creado si le pasamos 'N' 1,2" do
        expect(Auto.new('N',2,1,0).getPosicion_y).to eq 2 
    end
    it "deberia devolver la altura 5 del tablero si le pasamos 3,5" do
        expect(Tablero.new(3,5).getAlto).to eq 5 
    end
    it "deberia devolver el largo 3 del tablero si le pasamos 3,5" do
        expect(Tablero.new(3,5).getLargo).to eq 3
    end    
    it "deberia devolver true si el auto fue ingresado correctamente en el tablero" do
        tablero=Tablero.new(3,5)
        auto=Auto.new('N',1,2,0)
        expect(tablero.addAuto(auto)).to eq true
    end
    it "deberia devolver false si el auto no fue ingresado correctamente en el tablero" do
        tablero=Tablero.new(3,5)
        auto=Auto.new('N',2,5,0)
        expect(tablero.addAuto(auto)).to eq false
    end
    it "deberia devolver posicion y+1 <0> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('N',1,2,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_y).to eq 0
    end
    it "deberia devolver posicion x-1 <1> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('O',2,2,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_x).to eq 1
    end
    it "deberia devolver posicion x+1 <2> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('E',1,2,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_x).to eq 2
    end
    it "deberia devolver posicion y-1 <1> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('S',1,2,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_y).to eq 2
    end

    it "deberia devolver posicion x sin moverse <1> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('O',1,2,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_x).to eq 1
    end  
    it "deberia devolver posicion x sin moverse <3> si le pasamos el comando avanzar "do
        tablero=Tablero.new(3,5)
        auto=Auto.new('E',2,3,0)
        tablero.addAuto(auto)
        auto.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
        expect(auto.getPosicion_x).to eq 3
    end


    it "deberia añadir varios autos"do
        tablero=Tablero.new(3,5)
        auto=Auto.new('E',1,2,0)
        auto2=Auto.new('N',2,2,0)
        expect(tablero.addAuto(auto)&&tablero.addAuto(auto2)).to eq true
    end


    it "deberia devolver E si le pasamos un auto orientaion N y el comando girarDerecha()" do
        auto=Auto.new('N',3,2,0)
        auto.girarDerecha()
        expect(auto.getOrientacion).to eq 'E' 
    end
    it "deberia devolver S si le pasamos un auto orientaion E y el comando girarDerecha()" do
        auto=Auto.new('E',3,2,0)
        auto.girarDerecha()
        expect(auto.getOrientacion).to eq 'S' 
    end
    it "deberia devolver O si le pasamos un auto orientaion S y el comando girarDerecha()" do
        auto=Auto.new('S',3,2,0)
        auto.girarDerecha()
        expect(auto.getOrientacion).to eq 'O' 
    end
    it "deberia devolver N si le pasamos un auto orientaion O y el comando girarDerecha()" do
        auto=Auto.new('O',3,2,0)
        auto.girarDerecha()
        expect(auto.getOrientacion).to eq 'N' 
    end
    it "deberia devolver O si le pasamos un auto orientaion N y el comando girarIzquierda()" do
        auto=Auto.new('N',3,2,0)
        auto.girarIzquierda()
        expect(auto.getOrientacion).to eq 'O' 
    end
    it "deberia devolver S si le pasamos un auto orientaion O y el comando girarIzquierda()" do
        auto=Auto.new('O',3,2,0)
        auto.girarIzquierda()
        expect(auto.getOrientacion).to eq 'S' 
    end
    it "deberia devolver E si le pasamos un auto orientaion S y el comando girarIzquierda()" do
        auto=Auto.new('S',3,2,0)
        auto.girarIzquierda()
        expect(auto.getOrientacion).to eq 'E' 
    end
    it "deberia devolver N si le pasamos un auto orientaion E y el comando girarIzquierda()" do
        auto=Auto.new('E',3,2,0)
        auto.girarIzquierda()
        expect(auto.getOrientacion).to eq 'N' 
    end
    it "deberia añadir comandos a los autos" do
        auto=Auto.new('E',2,3,0)
        auto.addComando("IADAI")
        expect(auto.getComando).to eq "IADAI"
    end
    it "deberia crear obctaculo y verificar su posicion en y" do
        obstaculo=Obstaculo.new(2,3)
        expect(obstaculo.getPosicionObs_y).to eq 2
    end
    it "deberia crear obctaculo y verificar su posicion en x" do
        obstaculo=Obstaculo.new(2,3)
        expect(obstaculo.getPosicionObs_x).to eq 3
    end
    it "deberia añadir obstaculos al tablero" do
        obstaculo=Obstaculo.new(2,3)
        tablero=Tablero.new(3,5)
        expect(tablero.addObstaculo(obstaculo)).to eq true
    end
    # it "deberia devolver 6 si le pasamos 6,5 1,2 N IAIA" do
    #     expect(getLargo_de_Entrada("6,5 1,2 N IAIA")).to eq 6 
    # end
    # it "deberia devolver 5 si le pasamos 5,5 1,2 N IAIA" do
    #     expect(getAlto_de_Entrada("6,5 1,2 N IAIA")).to eq 5 
    # end


    
end