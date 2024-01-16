package ru.kucherova.eduscore.services;

import ru.kucherova.eduscore.models.School;
import ru.kucherova.eduscore.models.User;
import ru.kucherova.eduscore.repositories.SchoolRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.kucherova.eduscore.repositories.UserRepository;

import java.security.Principal;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class SchoolService {
    private final SchoolRepository schoolRepository;
    private final UserRepository userRepository;
    public List<School> listSchools(String name){
        if (name != null) schoolRepository.findByName(name);
        return schoolRepository.findAll();
    }

    public School getSchoolById(Long id) {
        return schoolRepository.findById(id).orElse(null);
    }

    public List<School> getTopRatedSchoolsByAdmAreaAndCountAndYear(String admArea, int count, String year) {
        List<School> schools;
        if (admArea != null && year != null) {
            schools = schoolRepository.findByAdmAreaAndYear(admArea, year);
        } else if (admArea != null) {
            schools = schoolRepository.findByAdmArea(admArea);
        } else if (year != null) {
            schools = schoolRepository.findByYear(year);
        } else schools = schoolRepository.findAll();

        schools.sort(Comparator.comparing(School::getPassesOver220).reversed().thenComparing(School::getPassesUnder160));

        return schools.stream().limit(count).collect(Collectors.toList());
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
