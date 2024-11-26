# pragma version ^0.4.0

# Dynamic array of type uint256, max 3 elements

nums: public(DynArray[uint256,3])

#deploy
def__init__():
    self.nums.append(11)
    self.nums.append(22)
    self.nums.append(33)
    #This will revert (Appending to array with max 3 elements)
    #self.nums.append(44)

    #remove last element
    self.nums.pop()

    #delete all elements 
    self.nums = [] 
    #set values 
    self.nums = [1,2,3]


@external
@pure 
def examples(xs: DynArray[uint256, 5]) -> DynArray[uint256, 8]:
    ys: DynArray[uint256, 5] = [1,2,3] 
    #Copy xs into ys
    for x:  uint256 in xs: 
        yes.append(x)
        return ys 


@external
@pure
def filter(addrs: DynArray[address, 5}) -> DynArray[address, 5]:
    nonzeros:  DynArray[address, 5] = [] 
    for addr: address in addrs: 
        if addr !=empty(address):
            nonzeros.append(addr)
        return nonzeros  
