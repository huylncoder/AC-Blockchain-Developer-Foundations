// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
        bool isRegistered; 
    }
    // khai báo owner
    address public owner;

    // event ghi log khi thêm sinh viên
    event Studentsadded(string name, uint age, bool isRegistered);

    // constructor để set owner
    constructor() {
        owner = msg.sender;
    } 
    // kiểm tra nếu là owner mới được phép thêm sinh viên
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    mapping (address => Student) public people;

    // hàm đăng ký sinh viên
    function register(string memory _name, uint _age) public onlyOwner {
        people[msg.sender] = Student(_name, _age, true);
        emit Studentsadded(_name, _age, true);
    }

    // hàm lấy thông tin sinh viên
    function getStudent(address user) public view returns (string memory, uint) {
        Student memory sv =  people[user];
        return (sv.name, sv.age);
    }

    // hàm kiểm tra sinh viên đã đăng ký hay chưa
    function isStudentRegistered(address user) public view returns (bool) {
        Student memory sv =  people[user];
        return sv.isRegistered;
    }
}