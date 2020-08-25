package com.hrmssm.dao;

import com.hrmssm.pojo.Department;

import java.util.List;

public interface DepartmentMapper {
    List<Department> selectDepartments();
}
