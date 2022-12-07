// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // this is an abstraction technique
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }
}
