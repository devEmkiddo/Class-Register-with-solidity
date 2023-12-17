// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClassRegister{
    struct Student{
        uint256 studentId;
        string fullName;
        uint256 age;
        string sex;
        uint256 dateOfBirth;
    }

    event StudentAdded(
          uint256 indexed studentId,
          string fullName,
          uint256 age,
          string sex,
          uint256 dateOfBirth
    );
    event StudentRemoved(
          uint256 indexed studentId,
          string fullName,
          uint256 age,
          string sex,
          uint256 dateOfBirth
    );

    mapping (uint256 => Student) public students;

    uint256 private studentCount = 1;

    function addStudentToClass(string memory _fullName, uint256 _age, string memory _sex, uint256 _dateOfBirth) public {
         students[studentCount] = Student(studentCount, _fullName, _age, _sex, _dateOfBirth);
         studentCount ++;
         emit StudentAdded(students[studentCount].studentId, students[studentCount].fullName, students[studentCount].age, students[studentCount].sex, students[studentCount].dateOfBirth);
    }
   
    function getStudentById(uint256 _id) public view returns(string memory, uint256, string memory, uint256){
        return (students[_id].fullName, students[_id].age, students[_id].sex, students[_id].dateOfBirth);
    }
    
    function removeStudent(uint256 _id) public {
        delete students[_id];
        emit StudentRemoved(students[studentCount].studentId, students[studentCount].fullName, students[studentCount].age, students[studentCount].sex, students[studentCount].dateOfBirth);
    }
}
