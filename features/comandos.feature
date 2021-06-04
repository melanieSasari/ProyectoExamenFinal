Feature:
    Como nino
    Quiero ingresar comandos de creacion del tablero
    Para poder jugar con un auto y movimientos en el mismo
    
Scenario:
    Given visito la pgina de comandos
    When ingreso la posicion inicial del auto "3,3\n1,1 N\nDA"
    And presiono el boton "ejecutar"
    Then deberia mostrar la posicion inicial del auto "Posicion Inicial:1,1 N"