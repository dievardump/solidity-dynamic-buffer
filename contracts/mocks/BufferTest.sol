pragma solidity 0.8.9;

import '../DynamicBuffer.sol';

contract BufferTest {
    function allocate(uint256 size, uint256 howManyLoops)
        public
        view
        returns (string memory)
    {
        // 130 bytes * howManyLoops
        (, bytes memory buffer) = DynamicBuffer.allocate(howManyLoops * 130);

        for (uint256 idx = 0; idx < howManyLoops; ++idx) {
            DynamicBuffer.appendBytes(
                buffer,
                abi.encodePacked(
                    "%3Cmarker id='dot",
                    '3',
                    "' viewBox='-1 -1 2 2' markerWidth='",
                    'a',
                    "' markerHeight='",
                    'a',
                    "'%3E%3Ccircle r='1' fill='%23",
                    'colorMap',
                    "'/%3E%3C/marker%3E"
                )
            );
        }

        return string(buffer);
    }
}
