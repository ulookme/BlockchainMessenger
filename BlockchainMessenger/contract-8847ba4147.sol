// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

contract MsgBlockchain {
    uint public conter;
    address public owner;
    address public recipt;
    string public message;

    constructor() {
        owner = msg.sender;
    }

    function updMessage(string memory _newMessage) public {
        if (msg.sender == owner) {
            // Le propriétaire met à jour le message
            message = _newMessage;
            conter++;
            recipt = address(0); // Réinitialiser le destinataire, pas encore de réponse
        } else {
            // Un autre utilisateur essaie de répondre
            require(bytes(message).length > 0, "No message to reply to.");
            require(recipt == address(0), "Message has already been replied to.");
            recipt = msg.sender; // Enregistrer l'adresse de celui qui répond
            message = _newMessage;
            conter++;
        }
    }
}