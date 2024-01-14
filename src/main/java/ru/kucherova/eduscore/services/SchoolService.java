package ru.kucherova.eduscore.services;

import ru.kucherova.eduscore.models.School;
import ru.kucherova.eduscore.repositories.SchoolRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class SchoolService {
    private final SchoolRepository schoolRepository;
    public List<School> listSchools(String name){
        if (name != null) schoolRepository.findByName(name);
        return schoolRepository.findAll();
    }

    public School getSchoolById(Long id) {
        return schoolRepository.findById(id).orElse(null);
    }
}
