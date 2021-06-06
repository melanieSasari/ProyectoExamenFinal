require './lib/auto.rb'
require './lib/obstaculo.rb'
require './lib/pisoResbaladizo.rb'

class Tablero   
    # método inicializar clase
    def initialize(largo, alto)  
        # atributos           
        @alto = alto 
        @largo=largo
        @autos=Array.new
        @obstaculos=Array.new
        @pisosResbaladizos=Array.new
    end
    def getAlto()
        return @alto
    end
    def getLargo()
        return @largo
    end
    def EstaEnPosicionesNulas(auto)
        @autos.each do |a|
            if(a.getPosicion_x==auto.getPosicion_x && a.getPosicion_y==auto.getPosicion_y)
                return true
            end            
        end
        return auto.getPosicion_x>=@largo||auto.getPosicion_y>=@alto ||auto.getPosicion_x<0||auto.getPosicion_y<0
    end
    
    def addAuto(auto)
        if( EstaEnPosicionesNulas(auto) )
            return false            
        else
            @autos.push(auto)
            return true
        end
        
    end
    def getObstaculos()
        return @obstaculos
    end
    def addObstaculo(obstaculo)
        @obstaculos.push(obstaculo)
        return true
    end
    def addPisoResbaladizo(pisoResbaladizo)
        @pisosResbaladizos.push(pisoResbaladizo)
        return true
    end
    def getAutos()
        return @autos
    end
end  