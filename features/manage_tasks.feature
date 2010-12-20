Feature: Manage tasks
  In order to keep track of what Im doing
  As a busy person
  I need to be able to manage a list of current tasks
  
  Sceanrio: Tasklist first visit
    Given I am on the tasks page
    And the following tasks:
      |name|description|complexity|
    Then I should see "new task"
    
  Sceanrio: Tasklist with tasks already entered
    Given I am on the tasks page
    And the following tasks:
      |name|description|complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 3|description 3|3|
      |name 4|description 4|4|      
    Then I should see the following tasks:
      |Name|Description|Complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 3|description 3|3|
      |name 4|description 4|4|
    And I should see "new task"

  Scenario: Register new task
    Given I am on the new task page
    When I fill in "Name" with "name 1"
    And I fill in "Description" with "description 1"
    And I fill in "Complexity" with "1"
    And I press "Save"
    Then I should see "name 1"
    And I should see "description 1"
    And I should see "1"
  
  Scenario: Tasks which are not at the top of the list can be promoted
    Given I am on the tasks page    
    And the following tasks:
      |name|description|complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 3|description 3|3|
    Then I should see "promote name 2"
    And I should see "promote name 3"

  Scenario: Clicking promote on a task which is not at the top of the list it should be promoted to the top
    Given I am on the tasks page    
    And the following tasks:
      |name|description|complexity|
      |name 1|description 1|1|
      |name 2|description 2|2|
      |name 3|description 3|3|
    And I press "promote name 2"
    Then I should see the following tasks:
      |Name|Description|Complexity|
      |name 3|description 3|3|
      |name 1|description 1|1|
      |name 2|description 2|2|

