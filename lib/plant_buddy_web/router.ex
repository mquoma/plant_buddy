defmodule PlantBuddyWeb.Router do
  use PlantBuddyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlantBuddyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/plants", PlantController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlantBuddyWeb do
  #   pipe_through :api
  # end
end
