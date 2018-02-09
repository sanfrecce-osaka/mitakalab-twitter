class User < ApplicationRecord
  def to_param
    username
  end
end
