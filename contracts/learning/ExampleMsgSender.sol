// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract ExampleMsgSender {

    address public someAddress;

    function updateSomeAddress() public {
        someAddress = msg.sender;
    }
}
