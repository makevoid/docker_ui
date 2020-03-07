module Helpers; end

module Helpers::DokH

  # these helpers get injected directly into the views

  def containers
    Dok.containers
  end

  def images
    Dok.images
  end

end
