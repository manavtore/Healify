// SPDX-License-Identifier: MIT

pragma solidity = 0.8.24;

contract HealthRecords {

struct Record {
string firebaseId;
mapping(string => string) fileHashes;
mapping(address => mapping(string => bool)) accessGranted;
address patientAddress;
}

mapping(string => Record) private patientRecords;

function addRecord(string memory firebaseId, string memory documentId, string memory fileHash) public {
require(patientRecords[firebaseId].patientAddress == address(0), "Record already exists");
patientRecords[firebaseId].fileHashes[documentId] = fileHash;
patientRecords[firebaseId].patientAddress = msg.sender;
}


function grantAccess(string memory firebaseId, string memory documentId, address doctor) public {
require(patientRecords[firebaseId].patientAddress == msg.sender, "Unauthorized access");
patientRecords[firebaseId].accessGranted[doctor][documentId] = true;
}

function revokeAccess(string memory firebaseId, string memory documentId, address doctor) public {
require(patientRecords[firebaseId].patientAddress == msg.sender, "Unauthorized access");
patientRecords[firebaseId].accessGranted[doctor][documentId]  = false;
}

function hasAccess(string memory firebaseId, string memory documentId, address doctor) public view returns (bool) {
return patientRecords[firebaseId].accessGranted[doctor][documentId];
}
}
