// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/work1/Counter.sol";
import {ICounter} from "../src/work1/IContract.sol";

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

contract CounterInteractor is Script {
    function run() public {
        // Start broadcasting transactions from the signer
        vm.startBroadcast();

        // Replace this with your actual deployed contract address
        address counterAddress = 0x3cEbFd06F1c6E372567E9A599b124c137550BdE2;

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

// Counter Intractor with Interface

contract CoInInt is Script {
    function run() public {
        // Start broadcasting transactions from the default signer
        vm.startBroadcast();

        // Replace with your actual deployed contract address
        address counterAddress = 0x3cEbFd06F1c6E372567E9A599b124c137550BdE2;

        // Cast the address to the interface
        ICounter counter = ICounter(counterAddress);

        // 🔍 Read current value (view function - no transaction)
        uint256 current = counter.number();
        console.log("Current number:", current);

        // ➕ Set number
        uint256 newValue = 100;
        counter.setNumber(newValue);
        console.log("Set number to:", newValue);

        // ➚ Increment
        counter.increment();
        console.log("Incremented. New number:", counter.number());

        // ➘ Decrement
        counter.decrement();
        console.log("Decremented. New number:", counter.number());

        vm.stopBroadcast();
    }
}
