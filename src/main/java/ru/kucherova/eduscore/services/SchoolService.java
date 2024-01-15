package ru.kucherova.eduscore.services;

import ru.kucherova.eduscore.models.School;
import ru.kucherova.eduscore.models.User;
import ru.kucherova.eduscore.repositories.SchoolRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.kucherova.eduscore.repositories.UserRepository;

import java.security.Principal;
import java.util.List;

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

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
