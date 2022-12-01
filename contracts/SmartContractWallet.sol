// SPDX-License-Identifier: MIT
 
pragma solidity 0.8.16;

// this is for testing purposes
contract Consumer {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}


contract SmartWallet {
    address payable public owner;
    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public gaurdians;
    address payable nextOwner;
    mapping(address => mapping(address => bool)) nextOwnerGaurdianVotedBool;
    uint gaurdiansResetCount;
    uint public constant comfirmationsFromGaudiansForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGaurdian(address _gaurdian, bool _isGaurdian) public {
        require(msg.sender == owner, "you are not the owner, aborting");
        gaurdians[_gaurdian] = _isGaurdian;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(gaurdians[msg.sender], "You are not gaurdian of this wallet, go away");
        require(nextOwnerGaurdianVotedBool[_newOwner][msg.sender] == false, "You already voted aborting");

        if (_newOwner != nextOwner) {
            nextOwner = _newOwner;
            gaurdiansResetCount = 0;
        }

        gaurdiansResetCount++;

        if (gaurdiansResetCount >= comfirmationsFromGaudiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "you are not the owner, aborting");
        allowance[_for] = _amount;

        if (_amount > 0) {
            isAllowedToSend[_for] = true;
        }
        else {
            isAllowedToSend[_for] = false;
        }
    }

    // the payload allows us to interact with other contracts
    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory) {
        // require(msg.sender == owner, "You are not the owner, aborting!");
        if (msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send anything from this smart contract, aborting");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Aborting, call was not successfull");
        return returnData;
    }

    receive() external payable {}
}
