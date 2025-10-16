// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public owner;

    // Biến đếm số lượng ứng viên
    uint public candidateCount;

    // Mapping lưu danh sách ứng viên
    mapping (uint => Candidate) public candidates;
    // Mapping kiểm tra trạng thái bỏ phiếu
    mapping (address => bool) public hasVoted;

    // Event ghi log khi có phiếu bầu
    event Voted(address voter, uint candidateId);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "Only owners can add candidates");
        _;
    }

    // Hàm thêm ứng viên chỉ owner
    function addCandidate(string memory _name) public onlyOwner {
        candidates[candidateCount] = Candidate(_name, 0);
        candidateCount++;
    }

    // Hàm bỏ phiếu
    function vote(uint _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId < candidateCount, "Invalid candidate ID");
        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, _candidateId);
    }
}