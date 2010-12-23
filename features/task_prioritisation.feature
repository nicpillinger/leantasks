Feature: Prioritise tasks within a list
  In order to adapt to changing situations
  As a busy person
  I want to be able to reprioritise existing tasks
  
  Scenario: Promote a task not at the top to one space up the list
    Given the following task_list:
      |name|name 1|
    And that task_list has the following tasks:
      |name|complexity|
      |task 1|91|
      |task 2|92|
      |task 3|93|
    And I am on the task list page for task_list with id 1
    When I press "promote" for task with id 3
    Then show me the page 
    Then I should see the following tasks: 
      |task 1|91|
      |task 3|93|
      |task 2|92|


