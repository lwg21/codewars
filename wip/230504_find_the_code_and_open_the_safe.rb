# Find the code and open the safe
# https://www.codewars.com/kata/57a369307cb1f385230002e2/train/ruby

# Your task it to check the security of a safebox, you have to open it and take 3 items,
# then you should re-balance the total weight with an item inside your bag.
# Most of the informations are hidden (because of your task), so you will not receive much help from the description, just 2 tips:

# examine your object
# A = 2b

def open_the_safebox(safebox)
  safebox.open(0)
end

<Safebox:0x00005574aa7c7b98
  @base="aEcbccbdbaAAAbAccCdBddEDECaeAdeDcdbedABc",
  @code=[5, 9, 1, 9, 1],
  @magic_number=60,
  @opened=false,
  @switched=false,
  @contents={
    "Prism Stone"=>5,
    "Crystal Scroll"=>7,
    "White Soapstone"=>11,
    "Rusted Gold Coin"=>4,
    "Silvercat Ring"=>6,
    "Mimic Statuette"=>16,
    "Titanite Shard"=>14
  },
  @temp={
    "Prism Stone"=>5,
     "Crystal Scroll"=>7,
     "White Soapstone"=>11,
     "Rusted Gold Coin"=>4,
     "Silvercat Ring"=>6,
     "Mimic Statuette"=>16,
     "Titanite Shard"=>14
    },
  @temp2={
    "Rock"=>33,
     "Shoe"=>24,
     "Hat"=>11,
     "Heavy Rock"=>35,
     "Bag of Sand"=>26
    }
>


These are all the non-default methods:
(Void)instructions,
(Bool)open,
(Array)base_code,
(Int)weight,
(Hash)contents,
(Bool)finish,
(Void)close

def open_the_safebox(safebox)
  p safebox
  p safebox.open([5, 9, 1, 9, 1], 60)
  p safebox.instructions
  p $bag
  p safebox.base_code()
  p safebox.contents
  p safebox.finish
  p safebox.close
end
