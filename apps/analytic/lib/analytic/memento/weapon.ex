defmodule Memento.Weapon do
  #alias :mnesia, as: Mnesia

  use Memento.Table, attributes: [:name, :belong_to]
end
