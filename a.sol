// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Division {
    using Strings for uint256;

    function division(uint256 decimalPlaces, uint256 b, uint256 a) public pure returns(uint256 quotient, uint256 remainder, string memory result) {
        uint256 factor = 10**decimalPlaces;
        quotient  = b / a;
        bool rounding = 2 * ((b * factor) % a) >= a;
        remainder = (b * factor / a) % factor;
        if (rounding) {
            remainder += 1;
        }
        result = string(abi.encodePacked(quotient.toString(), '.', remainder.toString()));
    }
   
}