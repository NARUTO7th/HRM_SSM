package com.hrmssm.pojo;

import java.util.List;

public class Department {


    private Integer dep_id;
    private String departmentName;
    private List<Employee> employeeList;

    public Department() {
    }

    public Department(Integer dep_id, String departmentName) {
        this.dep_id = dep_id;
        this.departmentName = departmentName;
    }


    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    @Override
    public String toString() {
        return "Department{" + "dep_id=" + dep_id + ", departmentName='" + departmentName + '\'' + '}';
    }
}
