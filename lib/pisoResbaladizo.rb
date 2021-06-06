class PisoResvaladizo
    def initialize(posicionPiso_y,posicionPiso_x,desvio)          
        @posicionPiso_x=posicionPiso_x
        @posicionPiso_y=posicionPiso_y
        @desvio=desvio
    end
    def getPosicionPiso_y()
        return @posicionPiso_y
    end
    def getPosicionPiso_x()
        return @posicionPiso_x
    end
    def getDesvio()
        return @desvio
    end
end