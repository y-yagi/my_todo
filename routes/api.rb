class MyTodo
  route 'api' do |r|
    r.get 'todos' do
      Todo.all
    end
  end
end
