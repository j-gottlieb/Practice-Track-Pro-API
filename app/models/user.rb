# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :practices
  has_many :goals
end
