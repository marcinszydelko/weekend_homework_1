def pet_shop_name(shop)
  shop[:name]
end

def total_cash(shop)
  shop[:admin][:total_cash]
end

def add_or_remove_cash(shop,amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
    shop[:admin][:pets_sold]
end

def increase_pets_sold(shop,sold)
  shop[:admin][:pets_sold] += sold
end

def stock_count(shop)
  shop[:pets].size
end

def pets_by_breed(shop, breed)
  array = []
  pets = shop[:pets]
  iteration = 0

  pets.each do
    if pets[iteration][:breed] == breed
      array.push(pets[iteration])
    end
    iteration += 1
  end
  return array
end
#FIX THIS FUNCTION///////////////////////////////
def find_pet_by_name(shop, pets_name)
  animal = Hash.new
  pets = shop[:pets]
  iteration = 0

  pets.each do
    if pets[iteration][:name] == pets_name
      animal.merge!(pets[iteration])
    end
    iteration += 1
  end
#NOT THE BEST IDEA I GUESS???
  if animal.size == 0
    return nil
  else
  return animal
  end

end

def remove_pet_by_name(shop, pets_name)
  pets = shop[:pets]
  iteration = 0

  pets.each do
    if pets[iteration][:name] == pets_name
      pets.delete_at(iteration)
    end
    iteration += 1
  end
end

def add_pet_to_stock(shop,new_pet)
  shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].size
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)
  if pet != nil && customer[:cash] >= pet[:price]
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(shop, pet)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(shop, pet[:price])
    shop[:admin][:pets_sold] += 1
    #pets_sold(shop) += 1
  end
end



  ##
