// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BadBuyer} from "../src/Buyer.sol";

contract Shop {
    address owner;
    uint public price;
    bool public isOrder;

    constructor(address initOwner, uint initPrice) {
        owner = initOwner;
        price = initPrice;
    }

    function order() public {
        BadBuyer _buyer = BadBuyer(payable(msg.sender));
        if (_buyer.payPrice() >= price && !isOrder) {
            isOrder = true;
            price = _buyer.payPrice();
        }
    }

    function pay() public payable {
        require(isOrder, "Must order first!");
        payable(owner).transfer(price);
        owner = msg.sender;
        isOrder = false;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
