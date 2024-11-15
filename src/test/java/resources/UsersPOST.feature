Feature: Casos de pruebas de metodo POST

  Background:
    * configure ssl = true
    Given url baseURLReqRes


  Scenario: crear un usuario
    * path '/api/users'
    * request {"name": "Jose","job": "Student"}
    When method POST
    Then status 201
    And print response
    * def responseAPI = response
    * def nombre = responseAPI.name
    * print 'el nombre obteniado es: ' + nombre
    * match response.name == 'Jose'


  Scenario: crear usuario con request body desde Json
    * def bodyRequest = read('classpath:examples/data/req/UsuarioNuevo.json')
    * path '/api/users'
    * request bodyRequest
    When method POST
    Then status 201
    And print response


  Scenario Outline: crear 3 usurios : <id> <name> es <job>
    * path '/api/users'
    * request {"name": "#(name)","job": "#(job)"}
    * method POST
    Then status 201
    * print response
    Examples:
      | id | name   | job       |
      | 1  | Jose   | tester    |
      | 2  | Marlon | developer |
      | 3  | Ismael | Ux        |

  Scenario Outline: crear usuaios desde un archivo Json
    Given url baseURLReqRes
    * configure ssl = true
    * path '/api/users'
    * request {"name": "<name>","job": "<job>"}
    * method POST
    Then status 201
    * print response
    Examples:
      | read('classpath:examples/data/req/UsuariosDataDrivenConJson.json') |

Scenario: crear un usuaruo desde una funcion de una clase Java
  * def utilGeneranombres = Java.type('examples.util.Util')
  * def nameRandom = utilGeneranombres.obtenerNombreRandom()
  * print 'el nombre random es: ' + nameRandom
  * path '/api/users'
  * request {"name": "#(nameRandom)","job": "SWAT"}
  * method POST
  Then status 201
  * print response
