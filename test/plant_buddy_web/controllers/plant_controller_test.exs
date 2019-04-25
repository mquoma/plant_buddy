defmodule PlantBuddyWeb.PlantControllerTest do
  use PlantBuddyWeb.ConnCase

  alias PlantBuddy.Plants

  @create_attrs %{frequency: 42, last_water: ~N[2010-04-17 14:00:00.000000], location: "some location", name: "some name"}
  @update_attrs %{frequency: 43, last_water: ~N[2011-05-18 15:01:01.000000], location: "some updated location", name: "some updated name"}
  @invalid_attrs %{frequency: nil, last_water: nil, location: nil, name: nil}

  def fixture(:plant) do
    {:ok, plant} = Plants.create_plant(@create_attrs)
    plant
  end

  describe "index" do
    test "lists all plants", %{conn: conn} do
      conn = get conn, plant_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Plants"
    end
  end

  describe "new plant" do
    test "renders form", %{conn: conn} do
      conn = get conn, plant_path(conn, :new)
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "create plant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, plant_path(conn, :create), plant: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == plant_path(conn, :show, id)

      conn = get conn, plant_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Plant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, plant_path(conn, :create), plant: @invalid_attrs
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "edit plant" do
    setup [:create_plant]

    test "renders form for editing chosen plant", %{conn: conn, plant: plant} do
      conn = get conn, plant_path(conn, :edit, plant)
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "update plant" do
    setup [:create_plant]

    test "redirects when data is valid", %{conn: conn, plant: plant} do
      conn = put conn, plant_path(conn, :update, plant), plant: @update_attrs
      assert redirected_to(conn) == plant_path(conn, :show, plant)

      conn = get conn, plant_path(conn, :show, plant)
      assert html_response(conn, 200) =~ "some updated location"
    end

    test "renders errors when data is invalid", %{conn: conn, plant: plant} do
      conn = put conn, plant_path(conn, :update, plant), plant: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "delete plant" do
    setup [:create_plant]

    test "deletes chosen plant", %{conn: conn, plant: plant} do
      conn = delete conn, plant_path(conn, :delete, plant)
      assert redirected_to(conn) == plant_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, plant_path(conn, :show, plant)
      end
    end
  end

  defp create_plant(_) do
    plant = fixture(:plant)
    {:ok, plant: plant}
  end
end
