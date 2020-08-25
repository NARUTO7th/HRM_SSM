package com.hrmssm.service;

import com.hrmssm.dao.DepartmentMapper;
import com.hrmssm.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @RequestMapping(value = "/departments", method = RequestMethod.GET)
    @ResponseBody
    public List<Department> departments(){
        return departmentMapper.selectDepartments ();
    }
}
