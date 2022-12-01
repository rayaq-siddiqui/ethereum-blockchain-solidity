// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleString {
    string public myString = "Hello World";
    // bytes are equivalent to strings here
    bytes public myBytes = "Hello World";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    // simple string comparision function
    function compareTwoStrings(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(_myString)) == keccak256(abi.encodePacked(myString));
    }
}
