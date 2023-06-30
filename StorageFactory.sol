//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

//This is good to import, but named imports are better; an imported .sol file could have mupltile contracts in it
//But to reduce computational cost, we want to import only those contacts that we are gonna use for sure
//import "./SimpleStorage.sol";

//named import
import {SimpleStorage} from "./SimpleStorage.sol";

 
contract StorageFactory{

    //contract keyword (in the imported contract file) allows us to create a new var type (of contract)
    //
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorgaeContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //how to interact with the functions in the contracts we create through this StFactory contract
    function stStorage(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //in order to interact with a contract, we need the address and the ABI (or only the function selector)
        //ABI = Application Binary Interface: tells us how we can exactly interact with the contract
        //List of simplestorage contracts automatically compact with the addresses and ABIs
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

}

