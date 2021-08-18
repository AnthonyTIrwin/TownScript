pragma solidity ^0.6.0;
import "./MerchSwapWhitelist.sol";

contract MerchSwap{


MerchSwapWhitelist mswl;

function ExchangeBack(uint256 amount) external nonReentrant  {
    require(mswl.MerchSwapWhitelist(message.sender), "Not a Merchant");
    require(amount > 0, "Cannot deposit 0 to exchange");
    require(amount < from.balanceOf(msg.sender), "not enough token");
    _totalSupply = _totalSupply.add(amount);
    _balances[msg.sender] = _balances[msg.sender].add(amount);
    from.safeTransferFrom(msg.sender, address(this), amount);
    to.safeTransfer(msg.sender, amount*10**18);
}