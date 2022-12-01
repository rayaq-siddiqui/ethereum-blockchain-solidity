// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleUint {
    uint public myUint; // same as uint256 [0, 2^256 - 1]

    uint8 public myUint8 = 2**4;  // like python

    int public myInt = -10;

    function setMyUint(uint _muUint) public {
        myUint = _muUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incremenInt() public {
        myInt++;
    }
}
