class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(thing,status)
    for i in 0..thing.size-1
      if status[i]
      print "#{i+1}. #{thing[i]} [x]\n"
    else
      print "#{i+1}. #{thing[i]} [ ]\n"
    end
   end
	end

  def add(string)
   p "You successfully added '#{string}' to your tasks"
  end

  def delete(string)
    p "You successfully deleted '#{string}' from your tasks"
  end

  def complete(string)
    p "You successfully completed '#{string}' from your tasks"
  end

	def error
    p "Sorry NOT SORRY"
	end

  
end
