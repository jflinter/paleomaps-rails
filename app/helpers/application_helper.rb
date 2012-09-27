module ApplicationHelper

class ActionDispatch::Request #rails 2: ActionController::Request
  def remote_ip
    '76.173.29.77'
  end
end

end
