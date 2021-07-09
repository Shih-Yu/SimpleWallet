// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract SimpleWallet {
  // State Variables
  address payable  owner;

  // Events
  event Deposit(address sender, uint amount, uint balance);
  event Widthdraw(uint amount, uint balance);
  event Transfer(address to, uint amount, uint balance);

  // Modifiers
  modifier onlyOwner() {
    require(msg.sender == owner, "Must be owner");
    _;
  }
 
//  constructor() payable {
//      owner = msg.sender;
//  }
 
  // Functions
  function deposit(uint _amount) public payable {
      require(msg.value == _amount);
    emit Deposit(msg.sender, msg.value, address(this).balance);
  }

  function withdraw(uint _amount) public onlyOwner {
     require(_amount <= address(this).balance, "Cannot withdraw more than account balance");
    owner.transfer(_amount);
    emit Widthdraw(_amount, address(this).balance);
  }

  function transferFunds(address payable _to, uint _amount) public onlyOwner {
    _to.transfer(_amount);
    emit Transfer(_to, _amount, address(this).balance);
  }

  function getBalace() public view returns (uint){
    return address(this).balance;
  }
}