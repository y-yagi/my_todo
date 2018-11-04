require 'roda'
require 'allocation_tracer'

result = ObjectSpace::AllocationTracer.trace do
  class MyTodo < Roda
    plugin :default_headers,
      'Content-Type'=>'text/html',
      'Content-Security-Policy'=>"default-src 'self'; style-src 'self' https://maxcdn.bootstrapcdn.com;",
      'X-Frame-Options'=>'deny',
      'X-Content-Type-Options'=>'nosniff',
      'X-XSS-Protection'=>'1; mode=block'

    route do |r|
      r.root {}

      r.post 'todos' do; end

      r.on 'todo', Integer do |id|

        r.get {}
        r.post 'destroy' do; end
      end
    end
  end
  MyTodo.freeze.app
end

p ObjectSpace::AllocationTracer.allocated_count_table.values.sum
pp result.sort {|a, b| a[1][0] <=> b[1][0] }.reverse.first(5)
