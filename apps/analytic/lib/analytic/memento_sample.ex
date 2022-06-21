defmodule MementoSample do
  alias :mnesia, as: Mnesia

  use Memento.Table, attributes: [:username, :fullname]

  def mnesia_migration_sample() do
    case Mnesia.create_table(Person, attributes: [:id, :name, :job, :age]) do
      {:atomic, :ok} ->
        Mnesia.add_table_index(Person, :job)
        Mnesia.add_table_index(Person, :age)

      {:aborted, {:already_exists, Person}} ->
        case Mnesia.table_info(Person, :attributes) do
          [:id, :name, :job] ->
            Mnesia.wait_for_tables([Person], 5000)

            Mnesia.transform_table(
              Person,
              fn {Person, id, name, job} ->
                {Person, id, name, job, 21}
              end,
              [:id, :name, :job, :age]
            )

            Mnesia.add_table_index(Person, :age)

          [:id, :name, :job, :age] ->
            :ok

          other ->
            {:error, other}
        end
    end
  end
end
