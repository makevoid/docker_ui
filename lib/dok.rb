# DOCKER_HOST = "127.0.0.1"
# Docker.url  = "tcp://#{DOCKER_HOST}:5422"

class Dok
  def self.check
    new.check
  end

  def self.containers
    new.containers
  end

  def self.images
    new.images
  end

  def self.prune
    new.prune
  end

  def initialize

  end

  def check
    status = { status: :ok }
    begin
      status[:version] = Docker.version
    rescue Exception => e
      status = { status: :fail, exception: { message: e.message, object: e } }
    end
    Hashie::Mash.new status
  end

  def containers
    Docker::Container.all
  end

  def images
    Docker::Image.all
  end

  # prune

  # prune executes all these:
  
  # Docker::Container.prune
  # Docker::Image.prune
  # Docker::Network.prune
  # Docker::Volume.prune # usually the trickiest

  def prune
    %i(container image network volume).each do |section|
      Docker.const_get(section.capitalize).prune
    end
  end

  private

  # def mash_all(entries)
  #   entries.each do |entry|
  #     Hashie::Mash.new entry
  #   end
  # end
end
