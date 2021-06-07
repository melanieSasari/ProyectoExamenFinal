Feature:
    Como nino
    Quiero agregar piso resbaladizo al tablero
    Para que cuando llegue a la posicion del piso resbaladizo cambie la orientacion del auto

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n0,0\n1,1 D\n2,1 S 3\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:1,1 O"

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n0,0\n1,1 I\n2,1 S 3\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:1,1 E"