pragma solidity 0.8.4;

function withdrawYield() public {
        uint256 toTransfer = calculateYieldTotal(msg.sender);

        require(
            toTransfer > 0 ||
            imnBalance[msg.sender] > 0,
            "Nothing to withdraw"
            );
            
        if(imnBalance[msg.sender] != 0){
            uint256 oldBalance = imnBalance[msg.sender];
            imnBalance[msg.sender] = 0;
            toTransfer += oldBalance;
        }

        startTime[msg.sender] = block.timestamp;
        Imano.mint(msg.sender, toTransfer);
        emit YieldWithdraw(msg.sender, toTransfer);
    }