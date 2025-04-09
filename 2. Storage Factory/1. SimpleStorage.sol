// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; // solidity compiler version

contract SimpleStorage {
    // uint is initialized to 0 if no value is given
    uint256 myFavoriteNumber; // 0

    // array
    // uint256[] listOfFavoriteNumbers; // []

    // custom type Person
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public arun = Person({favoriteNumber: 7, name: "Arun"});

    // array of type Person.
    // This is dynamic array as it has dynamic size. Static array will be Person[3] public listOfPeople of size 3
    Person[] public listOfPeople;

    // mapping is like dictionary
    mapping(string => uint256) public nameToFavoriteNumber;

    // visiblity specifiers: public, private, external, internal. By default it will be internal
    // use `virtual` to allow function override
    function store(uint _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    // view keyword is a function modifiers which allows only to read the state from blockchain
    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    // Solidity Data Location Keywords: memory, storage, calldata
    // `calldata` is temporary, read-only, and cheapest for external inputs
    // `storage` is permanent and updates the blockchain state
    // `memory` keyword is temporary and modifiable, used inside functions
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
