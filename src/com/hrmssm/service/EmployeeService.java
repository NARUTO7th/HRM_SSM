package com.hrmssm.service;

import com.hrmssm.dao.EmployeeMapper;
import com.hrmssm.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getEmployees(){
        return employeeMapper.selectEmployees ();
    }

    public Integer addEmployee(Employee employee){
        return employeeMapper.insertEmployeeByObject (employee);
    }

    public boolean deleteEmployee(Integer id){
        return employeeMapper.deleteEmployeeById (id);
    }

    public Integer editEmployee(Employee employee){
        return employeeMapper.updateEmployeeByObject (employee);
    }

    public Employee getEmployeeById(Integer id){
        return employeeMapper.selectEmployeeById (id);
    }
}
