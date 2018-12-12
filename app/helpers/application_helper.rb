module ApplicationHelper

# deviseのformを別のコントローラーで呼ぶためのメソッド
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

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

	
end