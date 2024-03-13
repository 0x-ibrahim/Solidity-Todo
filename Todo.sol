// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Todo {
    struct TodoItem {
        string task;
        bool isCompleted;
    }
    mapping (uint256 => TodoItem) public list;
    uint256 public count = 0;
    address _owner;
    event TaskCompleted(uint256 indexed id);
    
    constructor(){
        _owner = msg.sender;

    }

    function addTask(string calldata task) onlyOwner public {


        TodoItem memory item = TodoItem({task: task, isCompleted: false});
        list[count] = item;
        count++;
    }

    function completeTask(uint256 id) onlyOwner public {

        if (!list[id].isCompleted)
            list[id].isCompleted = true;
        emit TaskCompleted(id);
    }
    modifier onlyOwner(){
        require(_owner == msg.sender, "Only Owner can call this");
        _;
    }
}