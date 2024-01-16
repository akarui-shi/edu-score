package ru.kucherova.eduscore.repositories;

import ru.kucherova.eduscore.models.School;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SchoolRepository extends JpaRepository<School, Long> {
    List<School> findByName(String name);
    List<School> findByAdmArea(String admArea);
    List<School> findByAdmAreaAndYear(String admArea, String year);

    List<School> findByYear(String year);
}