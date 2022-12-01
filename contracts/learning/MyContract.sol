// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

// class based approach of developing contract
contract MyContract {

    string public ourString = "Hello World";

    // _updateString is on our local memory
    function updateOurString(string memory _updateString) public {
        ourString = _updateString;
    }    
}
