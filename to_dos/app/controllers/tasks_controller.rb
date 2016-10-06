class TasksController
  def initialize(args)
    @view = TasksView.new
    @args = args
    control(@args[0])
  end

  def control(option)
    case option
    when "index"
      index
    when "add"
      add
    when 'delete'
      delete
    when 'complete'
      complete
    else
      @view.error
    end
  end

  def index
      todo = Task.pluck(:task)
      todo_status = Task.pluck(:status)
      @view.index(todo,todo_status)
  # TIP: Aquí debes de llamar al método del mismo nombre de @view
  end

  def add
     if @args[1] != nil
      string = make_string
      task = Task.new
      task.task = string
      task.index = 0
      task.status = false
      task.save
      @view.add(string)
    else
      @view.error
    end
  end

  def delete
    if @args[1] != nil
      string = find_me
      user = Task.find_by(task: string) if string!=nil
      user.destroy
      @view.delete(string)
    else
      @view.error
    end
  end

  def complete
    if @args[1] != nil
      string = find_me
      user = Task.find_by(task: string) if string!=nil
      user.status = true
      user.save
      @view.complete(string)
    else
      @view.error
    end
  end

  def make_string
    string = ""
    for i in 1..@args.size-1
      x=@args[i]
    string << "#{x} "
  end
  string.chop
  end

  def find_me
    todo = Task.pluck(:task)
    todo[@args[1].to_i-1]
  end
end
