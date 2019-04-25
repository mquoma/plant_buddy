defmodule PlantBuddy.Repo.Migrations.CreatePlants do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :name, :string
      add :location, :string
      add :frequency, :integer
      add :last_water, :naive_datetime

      timestamps()
    end

  end
end
