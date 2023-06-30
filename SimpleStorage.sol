//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber = 5;

    //uint[] listOfFavoriteNumbers; 

    //defining a custom type
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    //when working custom types, one has to declare the type on both sides
    ////Person public myFriend = Person({favoriteNumber: 7, name: "Pat"});

    //dynamic array - not defined how large it is
    Person[] public listOfPeople;

    //mapping works like a dicitonary
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    //memory and calldata means temporary vars
    //memory var: can be changed
    //calldata var: cannot be modified
    //stucts, mapping, and arrays have to be given this memory/calldta keyword
    function addPerson(string memory _name, uint _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}