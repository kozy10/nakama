module ApplicationHelper

	def breadcrumb(crumbs)
    return if crumbs.nil?
    content_tag :ol, class: 'breadcrumb' do
      crumbs.each_with_index do |crumb, i|
        if i == crumbs.size - 1
          concat (content_tag :li, crumb[:title], class: 'breadcrumb-item active')
        else
          concat (content_tag :li, (link_to crumb[:title], crumb[:path]), class: 'breadcrumb-item')
        end
      end
    end
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