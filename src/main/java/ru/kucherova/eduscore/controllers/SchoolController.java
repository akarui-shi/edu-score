package ru.kucherova.eduscore.controllers;

import ru.kucherova.eduscore.models.School;
import ru.kucherova.eduscore.services.SchoolService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class SchoolController {
    private final SchoolService schoolService;

    @GetMapping("/")
    public String schools(@RequestParam(name = "area", required = false) String area,
                          @RequestParam(name = "count", required = false, defaultValue = "10") int count,
                          @RequestParam(name = "year", required = false, defaultValue = "2022-2023") String year,
                          Principal principal, Model model) {
        List<School> schools = schoolService.getTopRatedSchoolsByAdmAreaAndCountAndYear(area,count,year);

        model.addAttribute("schools", schools);
        model.addAttribute("user", schoolService.getUserByPrincipal(principal));

        return "schools";
    }

    @GetMapping("/school/{id}")
    public String schoolInfo(@PathVariable Long id, Model model){
        model.addAttribute("school", schoolService.getSchoolById(id));
        return "school-info";
    }

}
