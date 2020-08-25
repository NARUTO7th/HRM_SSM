package com.hrmssm.controller;

import com.hrmssm.pojo.Department;
import com.hrmssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/departments",method = RequestMethod.GET)
    @ResponseBody
    public List<Department> departments(){
        List<Department> departments = departmentService.departments ();
        return departments;
    }
}
