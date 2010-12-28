Feature: Prioritise tasks within a list
  In order to adapt to changing situations
  As a busy person
  I want to be able to reprioritise existing tasks

  Scenario: Promote a task not right to the top by clicking its promote button
    Given the following task_list:
      |name|name 1|
    And that task_list has the following tasks:
      |name|complexity|
      |task 1|91|
      |task 2|92|
      |task 3|93|
    And I am on the task list page for task_list with id 1
    When I press "promote" for task with id 3
    Then I should see the following task list: 
      |task 3|
      |task 1|
      |task 2|

  Scenario: Demote a task not at the bottom to the very bottom of the 
    list by clicking its demote button
    Given the following task_list:
      |name|name 1|
    And that task_list has the following tasks:
      |name|complexity|
      |task 1|91|
      |task 2|92|
      |task 3|93|
    And I am on the task list page for task_list with id 1
    When I press "demote" for task with id 1
    Then I should see the following task list:
      |task 3|
      |task 2|
      |task 1|
