pragma solidity ^0.6.0;
// CreateWhitelist For Merchant Accounts
import "@openzeppelin/contracts/access/Ownable.sol";

contract MerchSwapWhitelist is Ownable {
    mapping(address => bool) allowed;

    function setMerchSwapWLCompleted(address _addr) public onlyOwner {
        allowed[_addr] = true;
    }

    function setMerchSwapWLRevoked(address _addr) public onlyOwner {
        allowed[_addr] = false;
    }

    function merchSwapWLCompleted(address _addr) public view returns(bool) {
        return allowed[_addr];
    }
}