Feature: Manage tasks
  In order to keep track of what Im doing
  As a busy person
  I need to be able to manage a list of current tasks
  
  Sceanrio: List tasks
    Given I am on the tasks page
    And the following tasks:
      |name|description|complexity|
    Then I should see "new task"
    
  Scenario: Register new task
    Given I am on the new task page
    When I fill in "Name" with "name 1"
    And I fill in "Description" with "description 1"
    And I fill in "Complexity" with "1"
    And I press "Save"
    Then I should see "name 1"
    And I should see "description 1"
    And I should see "1"
  
  @no-js-emulation
  Scenario: Delete task
    Given the following tasks:
      |name|description|complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 3|description 3|3|
      |name 4|description 4|4|
    When I delete the 3rd task
    Then I should see the following tasks:
      |Name|Description|Complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 4|description 4|4|
