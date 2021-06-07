Feature:
    Como nino
    Quiero agregar puentes al tablero
    Para que el auto atraviese el tablero desde una posicion en especifica a otra.
Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n0,0\n1,1 D\n0,2 2,2\n0,1 E 0\nAA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:2,2 E"

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n0,0\n1,1 D\n0,2 2,0\n0,1 E 0\nAA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:2,0 E"