// SPDX-License-Identifier: MIT

pragma solidity 0.8.18; // solidity compiler version
 
contract SimpleStorage {
    // basic types: boolean, uint, int, address, bytes. These types have default value boolean is false, uint is 0 etc.
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 83;
    int256 favoriteInt = -83;
    string favoriteColor = "Blue";
    address myAddress = 0xBa884108AFf77De0947BC3fF464a60Ea518f916a;   
    bytes32 favoriteBytes32 = "dog"; // bytes32 is different than bytes
}
