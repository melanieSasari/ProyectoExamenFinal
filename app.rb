require 'sinatra'
require './config'
require './lib/auto.rb'
require './lib/tablero.rb'
require './lib/obstaculo.rb'

get '/' do
    erb :bienvenida
end

post '/inicio' do
    @entrada=params[:campo_entrada]

    @largo_tablero=@entrada.to_s.split(/\r\n/)[0].to_s.split(/,/)[0].to_i
    @alto_tablero=@entrada.to_s.split(/\r\n/)[0].to_s.split(/,/)[1].to_i    
    
    tablero=Tablero.new(@largo_tablero,@alto_tablero)

    @pos_y_obstaculo=@entrada.to_s.split(/\r\n/)[1].to_s.split(/,/)[0].to_i
    @pos_x_obstaculo=@entrada.to_s.split(/\r\n/)[1].to_s.split(/,/)[1].to_i
    
    obstaculo=Obstaculo.new(@pos_y_obstaculo,@pos_x_obstaculo)
    tablero.addObstaculo(obstaculo)

    @largo_tablero1=tablero.getLargo
    @alto_tablero1=tablero.getAlto
    

    i=2
    while @entrada.to_s.split(/\r\n/)[i] != nil  do

        @pos_y_auto=@entrada.to_s.split(/\r\n/)[i].to_s.split(/,/)[0].to_i
        @pos_x_auto=@entrada.to_s.split(/\r\n/)[i].to_s.split(/,/)[1].to_i
        @orientacion_auto=@entrada.to_s.split(/\r\n/)[i].to_s.split("\s")[1]
        auto=Auto.new(@orientacion_auto,@pos_y_auto,@pos_x_auto)
        auto.addComando(@entrada.to_s.split(/\r\n/)[i+1].to_s)
        tablero.addAuto(auto)
        

        i+=2
    end
    


    # @pos_y_auto=@entrada.to_s.split(/\r\n/)[1].to_s.split(/,/)[0].to_i
    # @pos_x_auto=@entrada.to_s.split(/\r\n/)[1].to_s.split(/,/)[1].to_i
    # @orientacion_auto=@entrada.to_s.split(/\r\n/)[1].to_s.split("\s")[1]

    # auto=Auto.new(@orientacion_auto,@pos_y_auto,@pos_x_auto)

    # @pos_x_auto1=auto.getPosicion_x
    # @pos_y_auto1=auto.getPosicion_y

    # @orientacion_auto1=auto.getOrientacion
    @posxiniciales=[]
    @posyiniciales=[]
    @orientacioniniciales=[]

    tablero.getAutos.each do |a|
        @posxiniciales=@posxiniciales+[a.getPosicion_x]
    end

    tablero.getAutos.each do |a|
        @posyiniciales=@posyiniciales+[a.getPosicion_y]
    end
    tablero.getAutos.each do |a|
        @orientacioniniciales=@orientacioniniciales+[a.getOrientacion]
    end
    #tablero.addAuto(auto)

    @comandos_vista=[]
    tablero.getAutos.each do |a|
        @comandos_vista=@comandos_vista+[a.getComando]
    end

    
   # @comandos=@entrada.to_s.split(/\r\n/)[2].to_s.split(//)
    
    @listaAutosIniciales=tablero.getAutos

    @listaAutosIniciales.each do |a|

        @comando=a.getComando.to_s.split(//) #"A","I","A","D","A"

        @comando.each do |c|
            if(c=="A")
                a.avanzar(tablero.getLargo,tablero.getAlto,tablero.getAutos,tablero.getObstaculos)
            end
            if(c=="I")
                a.girarIzquierda
            end
            if(c=="D")
                a.girarDerecha
            end
        end
    end
    # @comandos.each do |c|
    #     if(c=="A")
    #         auto.avanzar(tablero.getLargo,tablero.getAlto)
    #     end
    #     if(c=="I")
    #         auto.girarIzquierda
    #     end
    #     if(c=="D")
    #         auto.girarDerecha
    #     end
    # end
    @listaAutosFinales=tablero.getAutos
    
    @posxfinales=[]
    @posyfinales=[]
    @orientacionfinales=[]

    tablero.getAutos.each do |a|
        @posxfinales=@posxfinales+[a.getPosicion_x]
    end

    tablero.getAutos.each do |a|
        @posyfinales=@posyfinales+[a.getPosicion_y]
    end
    tablero.getAutos.each do |a|
        @orientacionfinales=@orientacionfinales+[a.getOrientacion]
    end
    
    erb :inicio  
end
