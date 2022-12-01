// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleConstructor {

    address public myAddress;

    // called during deployement of the contract
    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }
}
