require 'pry'

def consolidate_cart(cart)
  cart.each_with_object({}) do |original_hash, resulting_hash|
    original_hash.each do |item, attributes|
      if resulting_hash[item]
        attributes[:count] += 1
        else
          attributes[:count] = 1
          resulting_hash[item] = attributes
      end
    end
  end
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else 
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost], :clearance => cart[name][:clearance]}
        #cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end 
      cart[name][:count] -= coupon[:num]
    end 
  end 
  cart 
end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if attributes[:clearance] == true 
      attributes[:price] = (attributes[:price] * 0.80).round(2)
    end 
  end 
end

def checkout
  binding.pry
  # consolidate_cart
  # apply_coupons(cart:[], coupons:[])
  # apply_clearance
end
