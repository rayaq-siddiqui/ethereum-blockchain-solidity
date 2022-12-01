// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;

    uint public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    // receive function
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    // fallback function
    // payable is optional
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}
