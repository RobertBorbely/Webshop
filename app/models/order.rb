class Order < ActiveRecord::Base
  belongs_to :shopping_cart
  belongs_to :user

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
      business: "merchant-real@szakdoga.com",
      cmd: "_xclick",
      upload: 1,
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      at: "#{Rails.application.secrets.pp}",
      invoice: id,
      amount: shopping_cart.total,
      item_name: shopping_cart.shopping_cart_items.first.item.name,
      item_number: shopping_cart.shopping_cart_items.ids,
      quantity: shopping_cart.shopping_cart_items.count,
      currency_code: 'USD',
      notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
