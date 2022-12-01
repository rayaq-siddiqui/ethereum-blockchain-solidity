// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

contract SendWithdrawMoney {

    uint public balanceReceived;
    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        uint amt = getContractBalance();
        balanceReceived -= amt;
        to.transfer(amt);
    }

    function withdrawToAddress(address payable to) public {
        uint amt = getContractBalance();
        balanceReceived -= amt;
        to.transfer(amt);
    }
}
