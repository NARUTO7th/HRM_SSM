package com.hrmssm.dao;

import com.hrmssm.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    List<Employee> selectEmployees();

    Integer insertEmployeeByObject(Employee employee);

    boolean deleteEmployeeById(Integer id);

    Integer updateEmployeeByObject(Employee employee);

    Employee selectEmployeeById(Integer id);

    List<Employee> searchByKeyword(@Param("keyword") String keyword);
}
