require './lib/obstaculo.rb'
class Auto   
    # método inicializar clase
    def initialize(orientacion, posicion_y,posicion_x,balas)  
        # atributos           
        @orientacion = orientacion 
        @posicion_x=posicion_x
        @posicion_y=posicion_y
        @balas=balas
        @comandos=nil
    end
    def addComando(comando)
        @comandos=comando
    end
    def getComando()
        return @comandos
    end
    def getOrientacion()
        return @orientacion
    end
    def setBalas(b)
        @balas=b
    end
    def getBalas()
        return @balas
    end
    def getPosicion_x()
        return @posicion_x
    end
    def getPosicion_y()
        return @posicion_y
    end
    def girarDerecha()
        case @orientacion
            when 'N'
                @orientacion='E'
            when 'E'
                @orientacion='S'
            when 'S'
                @orientacion='O'
            when 'O'
                @orientacion='N'
        end
    end
    def girarIzquierda()
        case @orientacion
            when 'N'
                @orientacion='O'
            when 'E'
                @orientacion='N'
            when 'S'
                @orientacion='E'
            when 'O'
                @orientacion='S'
        end
    end
    def avanzar(limite_largo,limite_alto,listaAutos,listaObstaculos)

        case @orientacion
            when 'S'
                libre=true
                listaAutos.each do |a|
                    if(@posicion_x ==a.getPosicion_x && @posicion_y+1 == a.getPosicion_y) 
                        libre=false
                        break
                    end
                end
                listaObstaculos.each do |o|
                 if(@posicion_x ==o.getPosicionObs_x && @posicion_y+1 == o.getPosicionObs_y)
                        if(@balas==0)
                            libre=false
                        else
                            @balas=@balas-1
                        end
                        break
                  end
                end
                if(@posicion_y+1<limite_alto && libre)
                    @posicion_y=@posicion_y+1
                end
            when 'N'
                libre=true
                listaAutos.each do |a|
                    if(@posicion_x ==a.getPosicion_x &&  @posicion_y-1 == a.getPosicion_y) 
                        libre=false
                        break
                    end
                end
                listaObstaculos.each do |o|
                  if(@posicion_x ==o.getPosicionObs_x &&  @posicion_y-1 == o.getPosicionObs_y) 
                        if(@balas==0)
                            libre=false
                        else
                            @balas=@balas-1
                        end
                        break
                    end
                end
                if(@posicion_y-1>=0 && libre)
                    @posicion_y=@posicion_y-1
                end

            when 'O'
                libre=true
                listaAutos.each do |a|
                    if(@posicion_x-1 ==a.getPosicion_x && @posicion_y == a.getPosicion_y) 
                        libre=false
                        break
                    end
                end
                listaObstaculos.each do |o|
                    if(@posicion_x-1 ==o.getPosicionObs_x && @posicion_y == o.getPosicionObs_y) 
                        if(@balas==0)
                            libre=false
                        else
                            @balas=@balas-1
                        end
                        break
                    end
                end
                if(@posicion_x-1>=0 && libre)
                    @posicion_x=@posicion_x-1
                end
            when 'E'
                libre=true
                listaAutos.each do |a|
                    if(@posicion_x+1 ==a.getPosicion_x && @posicion_y == a.getPosicion_y) 
                        libre=false
                        break
                    end
                end
                listaObstaculos.each do |o|
                    if(@posicion_x+1 ==o.getPosicionObs_x && @posicion_y == o.getPosicionObs_y) 
                        if(@balas==0)
                            libre=false
                        else
                            @balas=@balas-1
                        end
                        break
                    end
                end
                if(@posicion_x+1<limite_largo && libre)
                    @posicion_x=@posicion_x+1
                end
        end
    end

end
   
  