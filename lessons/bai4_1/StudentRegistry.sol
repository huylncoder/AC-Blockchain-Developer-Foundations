// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
        bool isRegistered; 
    }

    mapping (address => Student) public people;

    function register(string memory _name, uint _age) public {
        people[msg.sender] = Student(_name, _age, true);
    }

    function getStudent(address user) public view returns (string memory, uint) {
        Student memory sv =  people[user];
        return (sv.name, sv.age);
    }

    function isStudentRegistered(address user) public view returns (bool) {
        Student memory sv =  people[user];
        return sv.isRegistered;
    }
}