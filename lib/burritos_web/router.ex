defmodule BurritosWeb.Router do
  use BurritosWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BurritosWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  forward "/api", Absinthe.Plug, schema: BurritosWeb.Schema

  scope "/", BurritosWeb do
    pipe_through :browser
    get "/heading", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BurritosWeb do
  #   pipe_through :api
  # end
end
