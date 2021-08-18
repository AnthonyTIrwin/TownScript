// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./MyToken.sol";

contract TokenSwap {

  // StableCoin (simulated)
  address public stbCoin;

  // LocalCoin
  address public locCoin;

  uint256 public endBlock;

  constructor(
    address _stbCoin,
    address _locCoin,
    uint256 _endBlock

  ) public {
    stbCoin = _stbCoin;
    locCoin = _locCoin;
    endBlock = _endBlock;
  }

  event SwapForLocCoin(address indexed user,uint256 amount);

  function convertToLocToken(uint256 _inputAmt, address storAddress) public {

    require(block.number < endBlock, "too late :(");
    
    IERC20(stbCoin).safeTransferFrom(
      address(msg.sender),
      storAddress,
      _inputAmt
    );

    MyToken(locCoin).mint(msg.sender, _inputAmt);
    emit SwapForLocCoin(msg.sender,_inputAmt);
  }


}
