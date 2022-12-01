// SPDX-License-Identifier: MIT

// tells the compiler which version of solidity
pragma solidity 0.8.14;

// https://ethereum-blockchain-developer.com/2022-04-smart-wallet/06-try-catch-named-exceptions/

contract WillThrow {
    // custom errors
    error NotAllowedError(string);
    function aFunction() public pure {
        // require(false, "Error message");
        // assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // something
        } catch Error(string memory reason) {
            // this is for require
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
            // this is for assert statements
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowLevelData) {
            emit ErrorLogBytes(lowLevelData);
        }
    }
}
