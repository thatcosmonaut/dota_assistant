def fill_autocomplete(field, placeholder, options = {})
  fill_in placeholder, with: options[:with]

  page.execute_script %Q{ $('##{field}').trigger('focus') }
  page.execute_script %Q{ $('##{field}').trigger('keydown') }
  selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}

  page.should have_selector('ul.ui-autocomplete li.ui-menu-item a')
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end

