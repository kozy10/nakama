module ApplicationHelper
  def active_controller_and_action(controller_name, action_name)
    if params[:controller] == controller_name && params[:action] ==  action_name
      "active"
    else
      nil
    end
  end

  def controller?(controller)
		controller.include?(params[:controller])#引数が現在のコントローラーに含まれていたらtrueを返す
	end

	def action?(action)
		action.include?(params[:action])#引数が現在のアクションに含まれていたらtrueを返す
	end

	def hoge
		"hello"
	end
end