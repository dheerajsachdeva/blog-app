# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author
end
