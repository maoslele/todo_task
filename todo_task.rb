class Task
  attr_accessor :id
  attr_reader :name, :detail
  @@count = 0  

  def initialize(**params)  
    @id = @@count += 1
    @name = params[:name]
    @detail = params[:detail]
  end

end

class Todo
  
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks.push(task)
    puts "+ タスクを追加しました"
  end
  def show_task
    puts "------タスク一覧------"
    @tasks.each do |task|
      puts "ID: #{task.id}, タスク名：#{task.name} , タスク内容：#{task.detail}"
    end 
  end
   def delete_task(id:)
    if @tasks.find{ |task| task.id == id}
       @tasks.delete_if{ |task| task.id == id}
      puts "- タスク(ID:#{id})を削除しました"
    else
      #do nothing
      puts "! 指定されたタスクIDが見つかりません"
     end
   end
end

task1 = Task.new(name:"仕事", detail:"会議資料作成")
task2 = Task.new(name:"家事", detail:"夕食の買い出し")
task3 = Task.new(name:"勉強", detail:"課題提出")
task4 = Task.new(name:"勉強", detail:"環境構築")

todo_list = Todo.new
todo_list.add_task(task1)
todo_list.add_task(task2)
todo_list.show_task
todo_list.delete_task(id:1)
todo_list.show_task
todo_list.add_task(task3)
todo_list.delete_task(id:3)
todo_list.delete_task(id:5)
todo_list.add_task(task4)
todo_list.show_task



