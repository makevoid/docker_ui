# DOCKER_HOST = "127.0.0.1"
# Docker.url  = "tcp://#{DOCKER_HOST}:5422"

class Dok
  def self.containers
    new.containers
  end

  def self.images
    new.images
  end

  def initialize

  end

  def containers
    Docker::Container.all
  end

  def images
    Docker::Image.all
  end

  private

  # def mash_all(entries)
  #   entries.each do |entry|
  #     Hashie::Mash.new entry
  #   end
  # end
end
