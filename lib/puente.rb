class Puente
    def initialize(posInicio_y,posInicio_x,posFin_y,posFin_x)  
        # atributos           
        @posInicio_y=posInicio_y
        @posInicio_x=posInicio_x
        @posFin_y=posFin_y
        @posFin_x=posFin_x
    end
    def getPosInicio_y()
        return @posInicio_y
    end
    def getPosInicio_x()
        return @posInicio_x
    end
end