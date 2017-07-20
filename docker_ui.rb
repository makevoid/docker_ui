require_relative "./config/env"

class DockerUI < Sinatra::Base

  require_relative "lib/helpers/dokh"
  require_relative "lib/helpers/ui"
  helpers Helpers::DokH
  helpers Helpers::UI

  get "/" do
    haml :index
  end

  get "/images" do
    haml :images
  end

  post "/images" do
    # TODO: wrap with Dok
    container = Docker::Container.create('Cmd' => ['ls'], 'Image' => 'base')

    redirect "/"
  end

  post "/prune" do
    Dok.prune
    redirect "/"
  end

  ## (this should be auto generated, it is now semi-generated)
  ## - todo next scan files and auto generate routes

  def self.route_gen(name)
    get "/#{name}" do
      haml name.to_sym
    end
  end

  ROUTES = [
    "temp",
    "examples/menu",
    "examples/submenu",
  ]

  for route in ROUTES
    route_gen route
  end

end
