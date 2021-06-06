Feature:
    Como nino
    Quiero asignar balas a los autos 
    Para atravesar obstaculos

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n1,1\n2,1 E 3\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar el numero de balas del auto "Balas: 3"

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n1,1\n2,1 N 3\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar el numero de balas del auto "Balas: 2"

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n1,1\n2,1 N 3\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:1,1 N"

Scenario:
    Given visito la pagina de comandos
    When ingreso el campo de entrada "3,3\n1,1\n2,1 N 0\nA"
    And presiono el boton "ejecutar"
    #Then deberia mostrar La posicion final del auto "Posicion Final:2,1 N"