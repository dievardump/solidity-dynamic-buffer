pragma solidity >=0.8.0;

import '../DynamicBuffer.sol';

contract BufferTest {
    function allocate(uint256, uint256 howManyLoops)
        public
        pure
        returns (string memory)
    {
        // 130 bytes * howManyLoops
        (, bytes memory buffer) = DynamicBuffer.allocate(howManyLoops * 110);

        for (uint256 idx = 0; idx < howManyLoops; ++idx) {
            DynamicBuffer.appendBytes(
                buffer,
                abi.encodePacked(
                    'This is a test',
                    ' to see ',
                    ' how many calls can be done ',
                    ' using abi.encodePacked. ',
                    ' This string is 110 bytes long.'
                )
            );
        }

        return string(buffer);
    }
}
