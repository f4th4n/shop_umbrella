defmodule Memento.Hero do
  alias :mnesia, as: Mnesia

  use Memento.Table, attributes: [:name, :type]

  #    after add attributes, always modify migration(), edit 3rd arguments so it's same as memento attributes, and then run Memento.Hero.migration
  #
  #    :mnesia.delete_table(Memento.Hero)
  #
  #    nodes = [ node() ]
  #
  #    # Create the schema
  #    Memento.stop
  #    Memento.Schema.create(nodes)
  #    Memento.start
  #
  #    Memento.Table.create!(Memento.Hero, disc_copies: nodes)
  #    Memento.Table.create!(Weapon)
  #
  #    Memento.transaction! fn ->
  #      Memento.Query.write(%Memento.Hero{name: "Lich", type: "int"})
  #      Memento.Query.write(%Memento.Hero{name: "Lina", type: "int"})
  #      Memento.Query.write(%Memento.Hero{name: "Axe", type: "str"})
  #      Memento.Query.write(%Memento.Hero{name: "Riki", type: "agi"})
  #    end
  #
  #    Memento.transaction! fn ->
  #      Memento.Query.write(%Weapon{name: "Maneater", belong_to: "Axe"})
  #      Memento.Query.write(%Weapon{name: "Laguna", belong_to: "Lina"})
  #    end
  #
  #    test = Memento.transaction! fn -> Memento.Query.all(Memento.Hero) end
  #    test = Memento.transaction! fn -> Memento.Query.all(Weapon) end
  #
  #    Memento.transaction! fn -> Memento.Query.select(Memento.Hero, {:==, :name, "Lina"}) end

  def migration() do
    # :mnesia.delete_table(Memento.Hero)

    Mnesia.transform_table(
      Memento.Hero,
      fn {Memento.Hero, name, type} ->
        {Memento.Hero, name, type, 666}
      end,
      [:id, :type, :hp]
    )
  end
end
