// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleViewPure {

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function setMyStorageVariable(uint _newVar) public {
        myStorageVariable = _newVar;
    }
}
