# Help Suzuki purchase his Tofu!
# https://www.codewars.com/kata/57d4ecb8164a67b97c00003c/train/ruby

# Help Suzuki purchase his Tofu! Suzuki has sent a lay steward to market who will purchase some items not produced in the
# monastary gardens for the monks. The stewart has with him a large box full of change from donations earlier in the day
# mixed in with some personal items. You will be given a string of items representing the box.
# Sort through the items in the box finding the coins and putting aside anything else.

# Return the following in your solution.
# [count of mon coins in box, count of monme coins in box,sum of all coins value in box, minimum number of coins needed for Tofu]

# 100 ≤ cost ≤ 1000

# The coins have the following values:
# monme = 60
# mon = 1

# box = 'mon mon mon mon mon apple mon mon mon mon mon mon mon monme mon mon monme mon mon mon mon cloth monme mon mon mon mon mon mon mon mon cloth mon mon monme mon mon mon mon monme mon mon mon mon mon mon mon mon mon mon mon mon mon'
# cost = 124
# returns
# [45, 5, 345, 6]

# Determine the minimum number of coins to pay for tofu. You must pay with exact change and if you do not have the correct change return “leaving the market”.
# If the cost of tofu is higher than your total amount of money also return “leaving the market”

def buy_tofu(cost,box)
  items = box.split(' ')
  mon = items.count('mon')
  monme = items.count('monme')
  sum = monme * 60 + mon
  monme_pay = [cost / 60, monme].min
  cost > monme_pay * 60 + mon ? 'leaving the market' : [mon, monme, sum, monme_pay + (cost - monme_pay * 60)]
end
