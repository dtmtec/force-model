require "active_support/concern"
require "active_support/core_ext"
require "active_model"

require "force/model/version"
require "force/field"
require "force/fields"

module Force
  module Model
    extend ActiveSupport::Concern

    included do
      include Force::Fields
    end
  end
end
