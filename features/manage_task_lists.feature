Feature: Create lists of tasks
  In order to maximise my productivity
  As a busy person
  I want to be able to create multiple prioritised lists of tasks
  
  Scenario: Create new task_list
    Given I am on the new task_list page
    When I fill in "Name" with "name 1"
    And I press "Save"
    Then I should see "name 1"

  Scenario: Delete task_list
    Given the following task_lists:
      |name|
      |name 1|
      |name 2|
      |name 3|
      |name 4|
    When I delete the 3rd task_list
    Then I should see the following task_lists:
      |Name|
      |name 1|
      |name 2|
      |name 4|
  
  Scenario: Add a less important task to the bottom of a task list
    Given the following task_list:
      |name|name 1|
    And that task_list has the following tasks:
      |name|complexity|
      |task 1|91|
      |task 2|92|    
    And I am on the task list page for task_list with id 1    
    When I follow "add a new task"
    Then I should see "task name"
    And I should see "complexity"
    And I should see "add task to the top of this list?"
    When I fill in "task_name" with "test task name"
    And I fill in "task_complexity" with "5"
    And I uncheck "task_add_to_top_of_list"
    And I press "add task to list"
    Then I should see "task successfully added to the bottom of the list"
    And I should be on the task list page for task_list with id 1
    And I should see the following task list:
      |task 1|
      |task 2|
      |test task name|

  Scenario: Add an important task to the top of a task list
    Given the following task_list:
      |name|name 1|
    And that task_list has the following tasks:
      |name|complexity|
      |task 1|1|
      |task 2|2|
    And I am on the task list page for task_list with id 1    
    When I follow "add a new task"
    Then I should see "task name"
    And I should see "complexity"
    And I should see "add task to the top of this list?"
    When I fill in "task_name" with "test task name"
    And I fill in "task_complexity" with "5"
    And I check "task_add_to_top_of_list"
    And I press "add task to list"
    Then I should see "task successfully added to the top of the list"
    And I should be on the task list page for task_list with id 1
    And I should see the following task list:
      |test task name|
      |task 1|
      |task 2|
