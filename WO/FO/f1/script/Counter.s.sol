// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/work1/Counter.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new Counter();

        vm.stopBroadcast();
    }
}

// Counter interaction script

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/work1/Counter.sol"; // Or wherever your Counter contract is located

contract CounterInteractor is Script {
    function run() public {
        // Start broadcasting transactions from the signer
        vm.startBroadcast();

        // Replace this with your actual deployed contract address
        address counterAddress = 0x6EFb288e47fE258B055E82E319179338c12D5347;

        Counter counter = Counter(counterAddress);

        // Read current number
        console.log("Current number:", counter.number());

        // Set number
        counter.setNumber(100);
        console.log("Set number to 69");

        // Increment
        counter.increment();
        console.log("Incremented. New number:", counter.number());

        // Decrement
        counter.decrement();
        console.log("Decremented. New number:", counter.number());

        vm.stopBroadcast();
    }
}
