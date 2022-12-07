// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

// https://ethereum.org/en/developers/docs/standards/tokens/erc-20/
abstract contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public virtual view returns (uint8);
}

contract TokenSale {

    uint public tokenPriceInWei = 1 ether;

    ERC20 public token;
    address public tokenOwner;

    constructor(address _token) {
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseACoffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money");
        uint tokenToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - (tokenToTransfer*tokenPriceInWei);
        token.transferFrom(tokenOwner, msg.sender, tokenToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder); // send the remainder of the money back
    }
}
