defmodule Events.Router do
  use Events.Web, :router

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

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: Events.PageController
  end

  scope "/admin", Events do
    pipe_through [:browser, :browser_auth]

    get "/", AdminController, :dashboard
  end

  scope "/", Events do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
    # resources "/session", SessionController, singleton: true, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Events do
  #   pipe_through :api
  # end
end
