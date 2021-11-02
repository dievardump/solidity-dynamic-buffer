const { expect } = require('chai');
const { deployments, ethers } = require('hardhat');
const fs = require('fs').promises;

describe('DynamicBuffer', () => {
    beforeEach(async () => {
        await deployments.fixture();

        const BufferTest = await ethers.getContractFactory('BufferTest');
        buffer = await BufferTest.deploy();
        await buffer.deployed();
    });

    describe('Dynamic buffer', async function () {
        it('try', async function () {
            const data = await buffer.allocate(20, 7000);
            console.log(`${data.length} bytes`);
        });
    });
});
