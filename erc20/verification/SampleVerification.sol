// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract MyContract {
    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer(address _to, uint _amount) public {
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }

    function someCrypticFunctionName(address _addr) public view returns(uint) {
        return balance[_addr];
    }
}
