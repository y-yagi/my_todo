class MyTodo
  route 'api' do |r|
    r.get 'todos' do
      @todos = Todo.all
    end
  end
end
