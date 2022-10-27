module Entryable
  extend ActiveSupport::Concern

  included { has_one :entry, as: :entryable, touch: true }
end
