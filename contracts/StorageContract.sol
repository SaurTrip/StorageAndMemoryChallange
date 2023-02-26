//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

// There are two flows of execution |- adduser -> updateBalanceInMemory -> getBalance
//                                  |_ adduser -> updateBalanceInStorage -> getBalance
// While first one will not have any state change in blockchain also balance is not changed if updateBalanceInMemory is invoked,
// on the other hand, in second flow there is state change also gas is spent when updateBalanceInStorage is invoked, as well as
// balance is update.

contract StorageContract {


mapping(uint => User) users;
 struct User{
     uint id;
     uint balance;
 }
 constructor(){
    
 }
 function addUser(uint id, uint balance) public {
     users[id] = User(id, balance);   
 }

function updateBalanceInMemory(uint id, uint balance) public view  {
     User memory user = users[id];
     user.balance = balance;
 }

 function updateBalanceInStorage(uint id, uint balance) public   {
     User storage user = users[id];
     user.balance = balance;
 }
 
function getBalance(uint id) public view returns (uint) {
    console.log("User id %s : %s balance",id,users[id].balance);
    return users[id].balance;
} 



}