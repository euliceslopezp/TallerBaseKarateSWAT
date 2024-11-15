Feature: Casos de pruebas de metodo GET

  Background:
    * configure ssl = true
    Given url baseURLReqRes


  Scenario: Listar usario por pagina 1
    * def numeroPage = 1
    * path '/api/users'
    * param page = numeroPage
    When method GET
    Then status 200
    And print response
    * match response.data[0].first_name == 'George'






