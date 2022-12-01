// SPDX-License-Identifier: MIT
 
pragma solidity 0.8.14;
 
contract ContractOne {
    mapping(address => uint) public addressbalances;
 
    function deposit() public payable {
        addressbalances[msg.sender] += msg.value;
    }
 
    receive() external payable {
        deposit();
    }
}
 
contract ContractTwo {
    receive() external payable {}
 
    function depositOnContract(address _contractOne) public {
        // ContractOne one = ContractOne(_contractOne);
        // one.deposit{value: 10, gas: 100000}();
 
        // // special syntax
        // bytes memory payload = abi.encodeWithSignature("deposit()");
        // (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
        // require(success);
 
        // low level call
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
