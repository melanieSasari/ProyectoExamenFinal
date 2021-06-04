class Obstaculo
    def initialize(posicionObs_y,posicionObs_x)  
        # atributos           
        @posicionObs_x=posicionObs_x
        @posicionObs_y=posicionObs_y
    end
    def getPosicionObs_x()
        return @posicionObs_x
    end
    def getPosicionObs_y()
        return @posicionObs_y
    end
end