package com.seba.languages.services;

import com.seba.languages.models.Language;
import com.seba.languages.repositories.LanguageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LanguageService {

    private final LanguageRepository languageRepository;

    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }

    public List<Language> allLanguage() {
        return languageRepository.findAll();
    }

    public Language createLanguage(Language language) {
        return languageRepository.save(language);
    }

    public Language findLanguage(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        return optionalLanguage.orElse(null);
    }

    public void deleteLanguage(Long id) {
        Language language = findLanguage(id);
        languageRepository.deleteById(language.getId());
    }

    public Language updateLanguage(Language language) {
        Language language1 = findLanguage(language.getId());
        language1.setName(language.getName());
        language1.setCreator(language.getCreator());
        language1.setCurrentVersion(language.getCurrentVersion());
        languageRepository.save(language1);
        return language1;
    }
}
