# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  def target_type_like?
    target_type == 'Like'
  end
end
