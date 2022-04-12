module ApplicationHelper
  # You can access the following helper in the controller by prepending helpers.method_name in your controller
  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end
end
