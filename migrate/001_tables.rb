Sequel.migration do
  change do
    create_table(:todos) do
      primary_key :id
      String :content, null: false
      DateTime :deadline
    end
  end
end
