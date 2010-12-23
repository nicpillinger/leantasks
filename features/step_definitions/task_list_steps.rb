When /^I delete the (\d+)(?:st|nd|rd|th) task_list$/ do |pos|
  visit task_lists_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

When /^I press "([^"]*)" for task with id (\d+)$/ do |link, task_id|
  click_link "#{link}_task_#{task_id}"
end

Then /^I should see the following task_lists:$/ do |expected_task_lists_table|
  expected_task_lists_table.diff!(tableish('table tr', 'td,th'))
end


Then /^I should see the following tasks:$/ do |expected_tasks_table|
  expected_tasks_table.diff!(tableish('table tr', 'td,th'))
end
