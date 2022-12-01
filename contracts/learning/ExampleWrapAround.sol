// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleWrapAround {
    uint public myUint; // same as uint256 [0, 2^256 - 1]

    uint8 public myUint8 = 2**4;  // like python


    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementMyUint() public {
        unchecked {
            myUint--;
        }
    }

    function incrementUint8() public {
        myUint8++;
    }
}
