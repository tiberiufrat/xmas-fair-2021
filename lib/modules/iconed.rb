module Iconed
  def name_with_icon
    "<i class=\"far mr-1 fa-fw fa-#{self.icon_with_default}\"></i> #{self.name}".html_safe
  end

  def icon_and_name
    "#{self.icon_with_default}##{self.name}"
  end

  def icon_with_default
    self.icon.present? ? self.icon : 'store'
  end
end