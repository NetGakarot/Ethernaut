// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract FakeToken is ERC20 {

    constructor() ERC20("FakeTOken","$Fake") {
        _mint(msg.sender, 1000 *10 **decimals());
    }
}
/*
Solution:
We can exploit swap() as there is no check for token1 and token2 so we can make a fake token.
And transfer and approve it to Dex2 address.
Then we can swap token1 and token2 for our fake token making token1 and token2 balance zero.
*/
