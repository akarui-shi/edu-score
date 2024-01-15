package ru.kucherova.eduscore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kucherova.eduscore.models.User;

public interface UserRepository  extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
