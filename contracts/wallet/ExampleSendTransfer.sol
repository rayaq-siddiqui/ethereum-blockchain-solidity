// SPDX-License-Identifier: MIT
 
pragma solidity 0.8.14;
 
contract Sender {
 
    receive() external payable {}
 
    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }
 
    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);
 
        require(isSent, "Send the funds is unsuccessful");
    }
}
 
contract ReceiverNoAction {
 
    function balance() public view returns(uint) {
        return address(this).balance;
    }
 
    receive() external payable {}
}
 
contract ReceiverAction {
    uint public balanceReceived;
 
    function balance() public view returns(uint) {
        return address(this).balance;
    }
 
    receive() external payable {
        balanceReceived += msg.value;
    }
}
