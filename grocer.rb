require "pry"

def consolidate_cart(cart)
  hash = {}
  cart.each do |items_hash|
    items_hash.each do |item, values_hash|
      if hash[item] == nil
        hash[item] = values_hash
        hash[item][:count] = 1
      else 
        hash[item][:count] += 1
      end
    end
  end
      
  hash
end

def apply_coupons(cart, coupons)

  coupons.each do |coupon_hash|
    coupon_hash.each do |key, value|
      if key == :item
        if cart.keys.include?(value)
          num_coup_used = cart[value][:count] / coupon_hash[:num]
          if num_coup_used > 0
            cart[value][:count] = cart[value][:count]%coupon_hash[:num]
            cart["#{value} W/COUPON"] = {price: coupon_hash[:cost], clearance: cart[value][:clearance], count: num_coup_used}
          end
        end
      end
    end
  end
  
  cart
end

def apply_clearance(cart)
  cart.each do |items, values_hash|
    if items[:clearance] == true
          cart[:price.to_i] *= 0.8
    end
  end
cart
end

def checkout(cart, coupons)
  # code here
end
