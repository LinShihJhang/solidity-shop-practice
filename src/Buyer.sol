// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Shop} from "./Shop.sol";

contract BadBuyer {
    Shop target;

    constructor(address _target) {
        target = Shop(_target);
    }

    /**
    * EXPLOIT START *
    */

    function payPrice() external view returns (uint) {
    }

    /**
    * EXPLOIT END *
    */
}
