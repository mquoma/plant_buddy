defmodule PlantBuddy.Plants.Plant do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plants" do
    field :frequency, :integer
    field :last_water, :naive_datetime
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :location, :frequency, :last_water])
    |> validate_required([:name, :location, :frequency, :last_water])
  end
end
