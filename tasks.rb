#!/usr/bin/ruby

$tasks = []
$tasks_file_path = './tasks_list'
$tasks_file = File.open($tasks_file_path,'a+')

def list_tasks()
  read_tasks()
  $tasks.each_with_index do |task,index|
    puts("#{index}: #{task}")
  end
end

def read_tasks()
  $tasks_file.each_line do |line|
    $tasks << line.strip()
  end
end

def add_task(task_str)
  read_tasks()
  $tasks << task_str
  write_tasks()
end

def delete_task(index)
  read_tasks()
  $tasks.delete_at(index)
  write_tasks()
end

def write_tasks()
  File.open($tasks_file_path, 'w') {|file| file.truncate(0) }
  $tasks_file = File.open($tasks_file_path,'a+')
  $tasks.each do |task|
    $tasks_file << task +"\n"
  end
end
    
if ARGV[0].eql?('a')
  add_task(ARGV[1])
elsif ARGV[0].eql?('r') or ARGV[0].eql?('l')
  list_tasks()
elsif ARGV[0].eql?('d')
  delete_task(ARGV[1].to_i())
end



