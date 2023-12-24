// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {Shop} from "../src/Shop.sol";
import {BadBuyer} from "../src/Buyer.sol";

contract ShopTest is Test {
    Shop shop;
    BadBuyer badBuyer;
    address initOwner = makeAddr("initOwner");
    address attacker = makeAddr("attacker");
    uint constant initPrice = 1 ether;

    function setUp() public {
        shop = new Shop(initOwner,initPrice);
        badBuyer = new BadBuyer(address(shop));

        vm.deal(address(shop), 2 ether);
        vm.deal(address(badBuyer), 1 ether);
    }

    function testAttack() public {

        vm.startPrank(attacker);
        /**
         * EXPLOIT START *
         */
        
        /**
         * EXPLOIT END *
         */
        vm.stopPrank();

        validation();
        console2.log(unicode"\n🎉 Congratulations, you can go to the next level! 🎉");
    }

    function validation() internal {
        assertEq(shop.getOwner(), address(badBuyer));
        assertEq(address(badBuyer).balance, 3 ether);
        assertEq(address(shop).balance, 0 ether);
    }
}
