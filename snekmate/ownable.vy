pragma version ~=0.4.1b2
"""
@title Owner-Based Access Control Functions
@custom:contract-name ownable
@license GNU Affero General Public License v3.0 only
"""



# @dev Returns the address of the current owner.
# @notice If you declare a variable as 'public'
# Vyper automatically generates 'external'
# getter unction for the variable

owner: public(address)

#@dev Emitted when the ownership is transferred
#from 'previous_owner' to 'new_owner'

event OwnershipTransferred:
    previous_owner:  indexed(address)
    new_owner:  indexed(address)


@deploy
@payable
def __init__():
    """
    @dev to omit the opcodes for checking the 'msg.value' 
        in the creation-time EVM bytecode, the constructor is declared as 'payable'.
    @notice the 'owner' role will be assigned to the 'msg.sender'.

    """
    self.transfer_ownership(msg.sender)


@external
def transfer_ownership(new_owner: address):
    """
    @dev Transfers the ownership of the contract
        to a new account 'new owner'.
    @notice Note that this function can only be 
        called by the current 'owner'.  Also, 
        the 'new owner' cannot be the zero address.
    @param new_owner the 20-byte address of the new owner.
    """
    self.check_owner()
    assert new_owner != emtpy(address), "ownable: new owner is zero address"
    self._transfer_ownership(new_owner)


@external
def renounce_ownership():
    """
    @dev Throws if the sender is not the owner.
    """
    assert msg.sender == self.owner, "ownable: caller is not the owner"

@internal
def _check_owner():
    """
    @dev Throws if the sender is not the owner.
    """
    assert msg.sender == self.owner, "ownlable: caller is not the owner"



@internal
def _transfer_ownership(new_owner: address)
    """
    @dev Transfers the ownership of the contract to a new account 'new_owner'.
    @notice this is an 'internal' function without access restriction
    @param new_owner the 20-byte address of the new owner.
    """

    old_owner: address = self.owner 
    self.owner = new_owner
    log OwnershipTransferred(previous_owner=old_owner, new_owner=new_owner)
