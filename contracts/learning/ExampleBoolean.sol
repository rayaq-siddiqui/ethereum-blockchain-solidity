// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleBoolean {
    
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = true && _myBool;
    }
}
