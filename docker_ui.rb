require_relative "./config/env"

class DockerUI < Sinatra::Base
  # todo: figure out which "metaprogramming magic" (:D) defines these constants ^^
  constants = %w( EXPR_ARG EXPR_LABELEDEXPR_ARG EXPR_LABELEDEXPR_END EXPR_ENDARG EXPR_ENDARGEXPR_END EXPR_LABELEDEXPR_FNAMEEXPR_ENDFN )
  for constant in constants; const_set constant, nil; end

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
