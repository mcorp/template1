module Template1
module Rails

module FormActionHelper

  def form_action_icon(action)
    icon_class = {
      delete: 'trash-o',
      edit: 'edit',
      view: 'eye'
    }[action.to_sym] || 'unknown'

    fa_icon icon_class
  end

  def form_action_class(action)
    action_class = {
      delete: 'danger',
      edit: 'warning',
      view: 'primary'
    }[action.to_sym] || 'unknown'

    "form-action action-#{action_class}"
  end

  def form_action_path(action_model)
    action, model = action_model.first

    model_name  = model.class.to_s.classify.underscore
    path_helper = (action == :edit) ? "edit_#{model_name}_path" : "#{model_name}_path"

    send path_helper.to_sym, model
  end

  def form_action(action_model)
    action_model = action_model.dup
    action, model = action_model.first
    action_model.delete action

    options = { class: form_action_class(action) }
    options.merge!(method: :delete, data: { confirm: 'Você tem certeza?' }) if action == :delete
    options.merge! action_model

    link_to form_action_path({action => model}), options do
      concat form_action_icon(action)
    end
  end

end

end
end
