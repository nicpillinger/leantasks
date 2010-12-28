Fabricator(:task_list) do
  name "fab task list"
  tasks(:count => 10) { |tl, i| Fabricate(:task, :task_list => tl, :name => "task #{i}", :complexity => i, :position => i) }
end
