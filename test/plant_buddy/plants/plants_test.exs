defmodule PlantBuddy.PlantsTest do
  use PlantBuddy.DataCase

  alias PlantBuddy.Plants

  describe "plants" do
    alias PlantBuddy.Plants.Plant

    @valid_attrs %{frequency: 42, last_water: ~N[2010-04-17 14:00:00.000000], location: "some location", name: "some name"}
    @update_attrs %{frequency: 43, last_water: ~N[2011-05-18 15:01:01.000000], location: "some updated location", name: "some updated name"}
    @invalid_attrs %{frequency: nil, last_water: nil, location: nil, name: nil}

    def plant_fixture(attrs \\ %{}) do
      {:ok, plant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plants.create_plant()

      plant
    end

    test "list_plants/0 returns all plants" do
      plant = plant_fixture()
      assert Plants.list_plants() == [plant]
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      assert Plants.get_plant!(plant.id) == plant
    end

    test "create_plant/1 with valid data creates a plant" do
      assert {:ok, %Plant{} = plant} = Plants.create_plant(@valid_attrs)
      assert plant.frequency == 42
      assert plant.last_water == ~N[2010-04-17 14:00:00.000000]
      assert plant.location == "some location"
      assert plant.name == "some name"
    end

    test "create_plant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_plant(@invalid_attrs)
    end

    test "update_plant/2 with valid data updates the plant" do
      plant = plant_fixture()
      assert {:ok, plant} = Plants.update_plant(plant, @update_attrs)
      assert %Plant{} = plant
      assert plant.frequency == 43
      assert plant.last_water == ~N[2011-05-18 15:01:01.000000]
      assert plant.location == "some updated location"
      assert plant.name == "some updated name"
    end

    test "update_plant/2 with invalid data returns error changeset" do
      plant = plant_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_plant(plant, @invalid_attrs)
      assert plant == Plants.get_plant!(plant.id)
    end

    test "delete_plant/1 deletes the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{}} = Plants.delete_plant(plant)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_plant!(plant.id) end
    end

    test "change_plant/1 returns a plant changeset" do
      plant = plant_fixture()
      assert %Ecto.Changeset{} = Plants.change_plant(plant)
    end
  end
end
